#!/bin/bash


################### Testes ################

# Compila e gera a versão gráfica do transdutor que tem o nome "porteiro" na forma porteiro+N+fp
fstcompile --isymbols=syms.txt --osymbols=syms.txt  test1.txt | fstarcsort > test1.fst
fstdraw    --isymbols=syms.txt --osymbols=syms.txt --portrait test1.fst | dot -Tpdf  > FINALexamples/test1.pdf

# Compila e gera a versão gráfica do transdutor que tem o adverbio "lentamente" na forma lentamente+ADV
fstcompile --isymbols=syms.txt --osymbols=syms.txt  test2.txt | fstarcsort > test2.fst
fstdraw    --isymbols=syms.txt --osymbols=syms.txt --portrait test2.fst | dot -Tpdf  > FINALexamples/test2.pdf

# Compila e gera a versão gráfica do transdutor que tem o verbo "plantar" na forma "plantas"
fstcompile --isymbols=syms.txt --osymbols=syms.txt  test3.txt | fstarcsort > test3.fst
fstdraw    --isymbols=syms.txt --osymbols=syms.txt --portrait test3.fst | dot -Tpdf  > FINALexamples/test3.pdf


################### Transdutores ################

# Compila e gera a versão gráfica do transdutor que gera nomes
fstcompile --isymbols=syms.txt --osymbols=syms.txt lemma2noun.txt | fstarcsort > FINALtransducers/lemma2noun.fst
fstdraw    --isymbols=syms.txt --osymbols=syms.txt --portrait FINALtransducers/lemma2noun.fst | dot -Tpdf  > FINALpdf/lemma2noun.pdf

# Compila e gera a versão gráfica do transdutor que gera adverbios
fstcompile --isymbols=syms.txt --osymbols=syms.txt lemma2adverb.txt | fstarcsort > FINALtransducers/lemma2adverb.fst
fstdraw    --isymbols=syms.txt --osymbols=syms.txt --portrait FINALtransducers/lemma2adverb.fst | dot -Tpdf  > FINALpdf/lemma2adverb.pdf

# Compila e gera a versão gráfica do transdutor que gera verbos no presente
fstcompile --isymbols=syms.txt --osymbols=syms.txt lemma2verbip.txt | fstarcsort > FINALtransducers/lemma2verbip.fst
fstdraw    --isymbols=syms.txt --osymbols=syms.txt --portrait FINALtransducers/lemma2verbip.fst | dot -Tpdf  > FINALpdf/lemma2verbip.pdf

# Compila e gera a versão gráfica do transdutor que gera verbos no preterito perfeito
fstcompile --isymbols=syms.txt --osymbols=syms.txt lemma2verbis.txt | fstarcsort > FINALtransducers/lemma2verbis.fst
fstdraw    --isymbols=syms.txt --osymbols=syms.txt --portrait FINALtransducers/lemma2verbis.fst | dot -Tpdf  > FINALpdf/lemma2verbis.pdf

# Compila e gera a versão gráfica do transdutor que gera verbos no futuro
fstcompile --isymbols=syms.txt --osymbols=syms.txt lemma2verbif.txt | fstarcsort > FINALtransducers/lemma2verbif.fst
fstdraw    --isymbols=syms.txt --osymbols=syms.txt --portrait FINALtransducers/lemma2verbif.fst | dot -Tpdf  > FINALpdf/lemma2verbif.pdf

# Compila e gera a versão gráfica do transdutor que gera todos os verbos
fstunion FINALtransducers/lemma2verbip.fst FINALtransducers/lemma2verbis.fst > temp.fst
fstunion FINALtransducers/lemma2verbif.fst temp.fst > FINALtransducers/lemma2verb.fst
rm temp.fst
fstdraw --isymbols=syms.txt --osymbols=syms.txt --portrait FINALtransducers/lemma2verb.fst | dot -Tpdf  > FINALpdf/lemma2verb.pdf

# Compila e gera a versão gráfica do transdutor que gera tudo
fstunion FINALtransducers/lemma2noun.fst FINALtransducers/lemma2adverb.fst > temp.fst
fstunion FINALtransducers/lemma2verb.fst temp.fst > FINALtransducers/lemma2word.fst
rm temp.fst
fstdraw --isymbols=syms.txt --osymbols=syms.txt --portrait FINALtransducers/lemma2word.fst | dot -Tpdf  > FINALpdf/lemma2word.pdf

fstinvert FINALtransducers/lemma2word.fst > FINALtransducers/word2lemma.fst
fstdraw --isymbols=syms.txt --osymbols=syms.txt --portrait FINALtransducers/word2lemma.fst | dot -Tpdf  >  FINALpdf/word2lemma.pdf


################### Testes aos transdutores ################

### test1 ###Compila e gera a versão gráfica dos transdutores para o teste 1

fstcompose test1.fst FINALtransducers/lemma2verb.fst > test1_lemma2verb.fst
fstdraw --isymbols=syms.txt --osymbols=syms.txt --portrait test1_lemma2verb.fst | dot -Tpdf > FINALexamples/test1_lemma2verb.pdf

fstcompose test1.fst FINALtransducers/lemma2word.fst > test1_lemma2word.fst
fstdraw --isymbols=syms.txt --osymbols=syms.txt --portrait test1_lemma2word.fst | dot -Tpdf > FINALexamples/test1_lemma2word.pdf

fstcompose test1.fst FINALtransducers/word2lemma.fst > test1_word2lemma.fst
fstdraw --isymbols=syms.txt --osymbols=syms.txt --portrait test1_word2lemma.fst | dot -Tpdf > FINALexamples/test1_word2lemma.pdf

### test2 ###Compila e gera a versão gráfica dos transdutores para o teste 2

fstcompose test2.fst FINALtransducers/lemma2verb.fst > test2_lemma2verb.fst
fstdraw --isymbols=syms.txt --osymbols=syms.txt --portrait test2_lemma2verb.fst | dot -Tpdf > FINALexamples/test2_lemma2verb.pdf

fstcompose test2.fst FINALtransducers/lemma2word.fst > test2_lemma2word.fst
fstdraw --isymbols=syms.txt --osymbols=syms.txt --portrait test2_lemma2word.fst | dot -Tpdf > FINALexamples/test2_lemma2word.pdf

fstcompose test2.fst FINALtransducers/word2lemma.fst > test2_word2lemma.fst
fstdraw --isymbols=syms.txt --osymbols=syms.txt --portrait test2_word2lemma.fst | dot -Tpdf > FINALexamples/test2_word2lemma.pdf


### test3 ###Compila e gera a versão gráfica dos transdutores para o teste 3

fstcompose test3.fst FINALtransducers/lemma2verb.fst > test3_lemma2verb.fst
fstdraw --isymbols=syms.txt --osymbols=syms.txt --portrait test3_lemma2verb.fst | dot -Tpdf > FINALexamples/test3_lemma2verb.pdf

fstcompose test3.fst FINALtransducers/lemma2word.fst > test3_lemma2word.fst
fstdraw --isymbols=syms.txt --osymbols=syms.txt --portrait test3_lemma2word.fst | dot -Tpdf > FINALexamples/test3_lemma2word.pdf

fstcompose test3.fst FINALtransducers/word2lemma.fst > test3_word2lemma.fst
fstdraw --isymbols=syms.txt --osymbols=syms.txt --portrait test3_word2lemma.fst | dot -Tpdf > FINALexamples/test3_word2lemma.pdf
