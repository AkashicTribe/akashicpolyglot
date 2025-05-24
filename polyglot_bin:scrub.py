import re
import unicodedata

# 1. Remove BOMs (Byte Order Marks)
def remove_bom(text: str) -> str:
    """Strip any BOM characters from the text."""
    return text.replace('\ufeff', '')

# 2. Strip control codes (except newline, carriage return, tab)
CONTROL_RE = re.compile(r'[\x00-\x08\x0B-\x0C\x0E-\x1F]')
def remove_control_codes(text: str) -> str:
    """Remove low‐codepoint control characters."""
    return CONTROL_RE.sub('', text)

# 3. Remove zero‐width & invisible characters
ZERO_WIDTH = [
    '\u200B',  # zero‐width space
    '\u200C',  # zero‐width non‐joiner
    '\u200D',  # zero‐width joiner
    '\u2060',  # word joiner
    '\uFEFF',  # BOM again
]
def remove_invisibles(text: str) -> str:
    """Strip any zero‐width or invisible Unicode chars."""
    for ch in ZERO_WIDTH:
        text = text.replace(ch, '')
    return text

# 4. Flag markdown-style bold/italic
BOLD_RE = re.compile(r"\*\*(.+?)\*\*")\ITALIC_RE = re.compile(r"\*(.+?)\*")
def flag_styles(text: str) -> tuple[str, bool, bool]:
    """Detect simple **bold** and *italic* markers."""
    has_bold = bool(BOLD_RE.search(text))
    has_italic = bool(ITALIC_RE.search(text))
    return text, has_bold, has_italic

# 5. Master deep-scrub pipeline
def deep_scrub(text: str) -> dict:
    """Run full scrub: BOM, control codes, invisibles, styles, normalize & wrap."""
    t = text
    t = remove_bom(t)
    t = remove_control_codes(t)
    t = remove_invisibles(t)
    t, bold, italic = flag_styles(t)
    # Normalize Unicode to NFC
    t = unicodedata.normalize('NFC', t)
    # Wrap lines longer than 80 characters
    wrapped_lines = []
    for line in t.splitlines():
        if len(line) > 80:
            wrapped_lines.extend([line[i:i+80] for i in range(0, len(line), 80)])
        else:
            wrapped_lines.append(line)
    clean_text = '\n'.join(wrapped_lines)

    return {
        'clean': clean_text,
        'has_bold': bold,
        'has_italic': italic
    }
