# Morphological Analyzer - Transducers (LN 2019/2020)

|   Group Members  |
|        :-:       |
|  Daniela Mendes  |
| Viviana Bernardo |

A project to create a morphological analyzer with transducers, which receives a portuguese word, converts it to its lemma and presents a morphological classification (via tags).

**Examples:**  
"alunos" is converted to "aluno+N+mp" (lemma+tags), because it is a noun, masculine and plural.
"inteligentemente" is converted to "inteligentemente+ADV" (lemma+tag), because it is an adverb.
"lavaste" is converted to "lavar+V+is+2s" (lemma+tags), because it is a verb, indicative and perfective past, and second person in singular.

*Note: only words that comply with the "normal" word formation rules for the nouns, adverbs and verbs of the 1st (ending in "ar") and only the following verb tenses (present, past and future) were considered. Even so, some words may be ambiguous.*