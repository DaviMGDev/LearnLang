# AI Translation Guide

This document explains how to adapt this template to another target language using AI.

## Template Philosophy

This book is designed for **passive exposure** — the learner listens to TTS reading the content. The content is plain Markdown lists with short example phrases. No grammar explanations, no exercises.

## Folder Structure

```
Learn<Language>/
├── 00_foundation/      # Universal: alphabet + pronunciation
├── 01_numbers/          # Universal: numbers (always Pattern C)
├── 02_around_you/       # Universal: objects, places, colors, adjectives
├── 03_actions/          # Universal: verbs, directions
├── 04_social/           # Universal: greetings, politeness, introductions
├── 05_time_and_weather/ # Universal: time, dates, weather
├── 06_food_and_shopping/ # Universal: food, shopping, restaurants
├── 07_phrases_and_more/ # Universal: questions, answers, misc
└── lang_specific/       # Language-specific plug-ins
```

## Translation Rules

### Universal Volumes (00–07)

These volumes contain **semantically identical** content across languages. Translate item by item:

1. **Preserve the Markdown structure exactly.** Same headings, same list format, same file names.
2. **Translate each item and each example phrase.** Do not add or remove items.
3. **Maintain TTS readability.** Output should flow naturally when read aloud by TTS. Avoid parenthetical asides, footnotes, or visual formatting.
4. **Keep lists as lists.** A comma-separated list in the source stays a comma-separated list in the target.

### Numbers (01_numbers) — Always Pattern C

Numbers always use the **spoken-first** pattern:

```markdown
## Numbers 0 to 10

zero, one, two, three, four, five, six, seven, eight, nine, ten

0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10
```

Translate the spoken number words. The numeral sequence stays the same (0, 1, 2...). Do not interleave.

### Different Script Languages — Add Pattern B

If the target language uses a non-Latin script **and** has an official romanization system, use the spoken-first / written-second pattern for vocabulary files:

```markdown
## Animals

cat, dog, bird, fish, horse

猫, 犬, 鳥, 魚, 馬
```

The romanized (spoken) form comes first. The native script form follows. Both are comma-separated sequences of the same items in the same order.

If the language has no widely-used romanization, skip the romanized form and use only the native script. The alphabet/pronunciation files should teach the script.

### lang_specific/ — Rewrite, Don't Translate

Files in `lang_specific/` depend on the **structural features** of the target language. Do not translate these item-by-item. Instead:

1. **Remove** any files that are irrelevant to the target language (e.g., `tones.md` for non-tonal languages, `honorifics.md` for languages without politeness levels).
2. **Add** new files for structural features unique to the target language. Examples:
   - `tones.md` — for tonal languages (Mandarin, Vietnamese, Thai)
   - `honorifics.md` — for languages with politeness levels (Japanese, Korean)
   - `noun_classes.md` — for languages with noun class systems (Swahili, Bantu languages)
   - `writing_system.md` — for languages with complex or non-alphabetic scripts
   - Any other feature that fundamentally changes how the language works

3. **Write new content** for each lang_specific file from scratch, following the same Markdown style as the universal volumes (plain lists, short example phrases, TTS-friendly).

### File Naming

- Keep file names in **English** (e.g., `greetings.md`, not `salutoj.md`). This makes the template navigable regardless of target language.
- Volume folder names are numbered and in English (`00_foundation/`).
- Language name goes in the root folder: `LearnRussian/`, `LearnMandarin/`, `LearnJapanese/`.

## Content Patterns

### Pattern A — Normal Vocabulary (universal volumes)
```markdown
## Theme

item1, item2, item3, item4, item5

short phrase using item1
short phrase using item3
short phrase mixing item2 and item4
```

### Pattern B — Different Script (lang_specific or adapted volumes)
```markdown
## Theme

romanized1, romanized2, romanized3, romanized4

script1, script2, script3, script4
```

### Pattern C — Numbers (always spoken-first)
```markdown
## Numbers X to Y

word1, word2, word3, word4

numeral1, numeral2, numeral3, numeral4
```
