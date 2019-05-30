export CSCOPE_DB=`pwd`/cscope.out
cscope -b -q -k
#gtags -i -f cscope.files
#cat cscope.files | etags -o etags -
cat cscope.files | xargs ctags -a --c++-kinds=+p --fields=+iaS --extra=+q --languages=c++
