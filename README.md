# LearnLang

A template system for learning any language through passive audio exposure. Each book is a folder of Markdown files designed to be read by text-to-speech — turn it on and let the language wash over you while you commute, cook, or walk.

## Philosophy

- **Pure input.** No exercises, no grammar explanations, no translations. Just the target language in your ear.
- **Guided tour.** Each book walks through the same natural progression: alphabet and sounds → numbers → everyday objects → actions → social phrases → time and weather → food and shopping → common questions.
- **TTS-native.** Every file is written to flow naturally when spoken aloud. Headings create pauses. Lists create rhythm. No footnotes, no asides.
- **Language-specific where it matters.** German gets articles and the one-and-twenty number pattern. Esperanto gets its correlative table and affix system. Mandarin would get tones.

## Available Books

| Language | Status | TTS Quality |
|----------|--------|-------------|
| German | Complete | Excellent |
| Esperanto | Complete | Limited |

## Project Structure

```
Learn<Language>/
├── README.md                  # Learner instructions
├── AI_TRANSLATION_GUIDE.md    # How to adapt this to another language
├── 00_foundation/             # Alphabet and pronunciation
├── 01_numbers/                # Counting, ordinals
├── 02_around_you/             # Objects, places, colors, adjectives
├── 03_actions/                # Verbs, directions
├── 04_social/                 # Greetings, politeness, introductions
├── 05_time_and_weather/       # Days, months, clock, weather
├── 06_food_and_shopping/      # Food, drinks, shopping, restaurants
├── 07_phrases_and_more/       # Questions, answers, emergencies
└── lang_specific/             # Language-specific features
```

Each file follows a consistent pattern: a `# Heading`, grouped vocabulary under `## Subsections`, and short example phrases that use the words in context. No English — every word is the target language.

## Quick Start

1. Pick a language folder.
2. Compile it into a single file:
   ```bash
   ./compiler.sh LearnGerman/
   # Produces LearnGerman.md
   ```
3. Feed `LearnGerman.md` to any TTS engine that supports the language.
4. Listen.

Or open individual files directly — each one stands alone as a short listening session.

## Adding a New Language

Read `AI_TRANSLATION_GUIDE.md` inside any existing book. It documents the template conventions, the three content patterns (A: normal vocab, B: different scripts, C: numbers), and how to handle the `lang_specific/` folder for language-specific features.

The template is designed for AI-assisted translation — translate the universal volumes item by item, then rewrite `lang_specific/` from scratch for the target language.

## Compiler

`compiler.sh` (with `compiler.pseudo` as spec) walks a book folder and concatenates all content into a single `.md` file for continuous TTS playback. It:

- Skips `README.md` and `AI_TRANSLATION_GUIDE.md`
- Validates every file has a `# Title` heading
- Inserts `---` separators between files
- Demotes `#` → `##` so the output nests cleanly

## License

This is a template — the structure and compiler are free to use and adapt. The book content itself is just vocabulary and example sentences in their respective languages.
