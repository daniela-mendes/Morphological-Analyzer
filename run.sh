#!/bin/bash


################### letras ################
#
# Compila e gera a versão gráfica do transdutor que tem "<palavra>"
#fstcompile --isymbols=syms.txt --osymbols=syms.txt  <palavra>.txt | fstarcsort > <palavra>.fst
#fstdraw    --isymbols=syms.txt --osymbols=syms.txt --portrait <palavra>.fst | dot -Tpdf  > <palavra>.pdf

# Compila e gera a versão gráfica do transdutor que tem "<palavra>"
#fstcompile --isymbols=syms.txt --osymbols=syms.txt  <palavra>.txt | fstarcsort > <palavra>.fst
#fstdraw    --isymbols=syms.txt --osymbols=syms.txt --portrait <palavra>.fst | dot -Tpdf  > <palavra>.pdf

# ...

################### Tradutores ################
#
# Compila e gera a versão gráfica do transdutor que gera nomes
fstcompile --isymbols=syms.txt --osymbols=syms.txt lemma2noun.txt | fstarcsort > noun.fst
fstdraw    --isymbols=syms.txt --osymbols=syms.txt --portrait noun.fst | dot -Tpdf  > noun.pdf

# Compila e gera a versão gráfica do transdutor que gera adverbios
fstcompile --isymbols=syms.txt --osymbols=syms.txt lemma2adverb.txt | fstarcsort > adv.fst
fstdraw    --isymbols=syms.txt --osymbols=syms.txt --portrait adv.fst | dot -Tpdf  > adv.pdf

# Compila e gera a versão gráfica do transdutor que gera verbos no presente
fstcompile --isymbols=syms.txt --osymbols=syms.txt lemma2verbip.txt | fstarcsort > verbip.fst
fstdraw    --isymbols=syms.txt --osymbols=syms.txt --portrait verbip.fst | dot -Tpdf  > verbip.pdf

# Compila e gera a versão gráfica do transdutor que gera verbos no preterito perfeito
fstcompile --isymbols=syms.txt --osymbols=syms.txt lemma2verbis.txt | fstarcsort > verbis.fst
fstdraw    --isymbols=syms.txt --osymbols=syms.txt --portrait verbis.fst | dot -Tpdf  > verbis.pdf

# Compila e gera a versão gráfica do transdutor que gera verbos no futuro
fstcompile --isymbols=syms.txt --osymbols=syms.txt lemma2verbif.txt | fstarcsort > verbif.fst
fstdraw    --isymbols=syms.txt --osymbols=syms.txt --portrait verbif.fst | dot -Tpdf  > verbif.pdf


################### Testa os tradutores ################
#
# Compila e gera a versão gráfica do transdutor que gera o nome na forma correta
#fstcompose <palavra>.fst noun.fst > <palavra-trad>.fst
#fstdraw --isymbols=syms.txt --osymbols=syms.txt --portrait <palavra-trad>.fst | dot -Tpdf > <palavra-trad>.pdf

# Compila e gera a versão gráfica do transdutor que gera o adverbio na forma correta
#fstcompose <palavra>.fst adv.fst > <palavra-trad>.fst
#fstdraw --isymbols=syms.txt --osymbols=syms.txt --portrait <palavra-trad>.fst | dot -Tpdf > <palavra-trad>.pdf

# Compila e gera a versão gráfica do transdutor que gera o verbo no presente na forma correta
#fstcompose <palavra>.fst verbip.fst > <palavra-trad>.fst
#fstdraw --isymbols=syms.txt --osymbols=syms.txt --portrait <palavra-trad>.fst | dot -Tpdf > <palavra-trad>.pdf

# Compila e gera a versão gráfica do transdutor que gera o verbo no preterito perfeito na forma correta
#fstcompose <palavra>.fst verbis.fst > <palavra-trad>.fst
#fstdraw --isymbols=syms.txt --osymbols=syms.txt --portrait <palavra-trad>.fst | dot -Tpdf > <palavra-trad>.pdf

# Compila e gera a versão gráfica do transdutor que gera o verbo no futuro na forma correta
#fstcompose <palavra>.fst verbif.fst > <palavra-trad>.fst
#fstdraw --isymbols=syms.txt --osymbols=syms.txt --portrait <palavra-trad>.fst | dot -Tpdf > <palavra-trad>.pdf



# Gera a versão textual das saídas
##fstproject --project_output batata.fst | fstrmepsilon | fsttopsort | fstprint --acceptor --isymbols=letras.sym