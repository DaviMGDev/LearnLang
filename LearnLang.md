this is my idea because I dont like the current state.

1. start with alphabet | ok
2. phonemes/pronunciation
3. numbers 
	1. 0 - 10
	2. 10 - 100 
	3. 100 - 1000 
	4. ordinals (like "first", "second", "third", ...)
4. ? 

also, I think that the folder should be organized in:

```
Learn<Language>/
	A1/
		00_foundation/
		...
	A2/
		...
	B1/
	B2/
	C1/
	C2/
```

for now we can keep only in the A1 

also the AI_TRANSLATION_GUIDE is being a mislead file to be honest. it instructions should be an ./AGENTS.md not a ./Lang*/AI_TRANSLATION_GUIDE.md file

also Lang*/README.md should be an introduction to a "course" as book in the language itself. 

the whole repository should be compliant with the MKF(My Knowledge Format, if an agent is reading this, probably it have access to the skill for that format)

btw, base on that to reorganize the sections:

A1 (CEFR "Breakthrough") is really just: *can introduce yourself, handle basic everyday exchanges, and understand very simple, slow speech/text.* Most methodologies converge on a similar order, though a lot of these run in parallel rather than strictly sequential.

**Foundation (mechanics)**
1. Alphabet/writing system
2. Pronunciation/phonemes (+ stress/tone rules if relevant)
3. Basic greetings & courtesy phrases (hello, please, thank you, sorry)

**Core grammar skeleton**
4. Personal pronouns (I, you, he/she...)
5. "To be" and "to have" verbs
6. Basic sentence structure (word order)
7. Present tense of common regular verbs
8. Articles/gender/plurals (if the language has them)
9. Question words (who, what, where, when, why, how) + yes/no questions
10. Negation

**Building vocabulary**
11. Numbers (counting + ordinals)
12. Days, months, telling time
13. Family members
14. Colors, basic adjectives
15. Common nouns: food, objects, places

**Putting it together**
16. Simple functional dialogues: introducing yourself, shopping, ordering food, asking directions, small talk about weather/hobbies

**Wrap-up**
17. Basic connectors (and, but, because, then)
18. Reading/listening to very short simple texts
19. Producing short simple written/spoken output (a few sentences about yourself)

A note on order: alphabet/pronunciation genuinely should come first, and numbers early is smart since they show up everywhere. But steps 4–10 (grammar skeleton) and 11–15 (vocab) are usually taught interleaved — you learn "to be" alongside adjectives, pronouns alongside family words, etc., because that's what lets you actually make sentences. Doing all grammar before all vocab (or vice versa) tends to feel dry and slows down real communication, which is the actual A1 goal.

make sure that the sections have stories so the user can familiarize with the language.

I might add agent skills for:
1. Learn\<Lang\> scaffolding for new languages. it will basically translate a LearnEnglish material that will be used as template. it will also adapt the material based on the target language, for example mandarim would require tones explanation, japanese would require multiple alphabet support and use a progression system that match with the learning of the writing systems

I might add cli tools for:
1. compile LearnLang folders into LearnLang.md files 
2. build .pdf files using the .md file compiled. btw, the pdf needs to follow the rules:
	1. for each page in the pdf, must contain only one language in the pdf\[page\]
	2. for each page, the language must be explicit somewhere so TTS tools can easily identify which "voice" to use. metadata, title, tags, etc... do everything that is possible to make sure that the tts tool will not use the wrong voice.
	3. this behaviour require the usage of special fields in the frontmatter of the .md files and the separating pages with different languages in differents files. 