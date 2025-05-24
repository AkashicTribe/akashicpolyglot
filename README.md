# akashicpolyglot

A macOS-first, foxlike pipeline that lets you 📸 grab any on-screen text, 🔍 OCR & deep-scrub it, and 🚀 export both UTF-8 & UTF-16-LE CSVs—automatically ✅ meeting our Minimum Acceptable Standard (MAS) in every run.

---

## 🧩 Overview

- **Capture:** Bind Option + ⌘ N (Automator Quick Action) to grab a screenshot to clipboard.  
- **OCR & Scrub:** Python CLI uses Tesseract to extract raw text, detects/removes control codes, BOMs, malformed code points, flags bold/italic, and enforces wrapping.  
- **Export:** Generates two CSVs—one UTF-8, one UTF-16-LE—each with your A2–A44 metadata schema.  
- **MAS Loop:** Inline assertions plus a weekly GitHub Actions cron job ensure perpetual compliance.

---

## ⚙️ Installation

1. **Clone**  
   ```bash
   git clone git@github.com:<org>/akashicpolyglot.git
   cd akashicpolyglot
