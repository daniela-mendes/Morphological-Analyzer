#!/bin/bash


################### letras ################ QUAL E A PASTA PARA GUARDAR OS EXEMPLOS.FST ?????
#
# Compila e gera a versão gráfica do transdutor que tem "<palavra>"
#fstcompile --isymbols=syms.txt --osymbols=syms.txt  test1.txt | fstarcsort > test1.fst
#fstdraw    --isymbols=syms.txt --osymbols=syms.txt --portrait test1.fst | dot -Tpdf  > FINALexamples/test1.pdf

# Compila e gera a versão gráfica do transdutor que tem "<palavra>"
#fstcompile --isymbols=syms.txt --osymbols=syms.txt  test2.txt | fstarcsort > test2.fst
#fstdraw    --isymbols=syms.txt --osymbols=syms.txt --portrait test2.fst | dot -Tpdf  > FINALexamples/test2.pdf

# Compila e gera a versão gráfica do transdutor que tem "<palavra>"
#fstcompile --isymbols=syms.txt --osymbols=syms.txt  test3.txt | fstarcsort > test3.fst
#fstdraw    --isymbols=syms.txt --osymbols=syms.txt --portrait test3.fst | dot -Tpdf  > FINALexamples/test3.pdf


################### Tradutores ################
#
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


################### Testa os tradutores - CORRIGIR!!!!!! ################

# Compila e gera a versão gráfica do transdutor que gera o verbo na forma correta
#fstcompose <palavra>.fst verb.fst > <palavra-trad>.fst
#fstdraw --isymbols=syms.txt --osymbols=syms.txt --portrait <palavra-trad>.fst | dot -Tpdf > <palavra-trad>.pdf

#fstcompose <palavra>.fst verb.fst > <palavra-trad>.fst
#fstdraw --isymbols=syms.txt --osymbols=syms.txt --portrait <palavra-trad>.fst | dot -Tpdf > <palavra-trad>.pdf

#fstcompose <palavra>.fst verb.fst > <palavra-trad>.fst
#fstdraw --isymbols=syms.txt --osymbols=syms.txt --portrait <palavra-trad>.fst | dot -Tpdf > <palavra-trad>.pdf

#

# Compila e gera a versão gráfica do transdutor que gera a palavra na forma correta
#fstcompose <palavra>.fst lemma2word.fst > <palavra-trad>.fst
#fstdraw --isymbols=syms.txt --osymbols=syms.txt --portrait <palavra-trad>.fst | dot -Tpdf > <palavra-trad>.pdf



# Gera a versão textual das saídas
##fstproject --project_output batata.fst | fstrmepsilon | fsttopsort | fstprint --acceptor --isymbols=letras.sym