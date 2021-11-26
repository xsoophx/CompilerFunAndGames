%{
#include <stdio.h>
#include <stdlib.h>

unsigned int charCount = 0;
unsigned int wordCount = 0;
unsigned int lineCount = 0;

%}

word [^ \t\n]+
eol \n

%%
{word} {++wordCount; charCount+=yyleng;}
{eol} {++charCount; ++lineCount;}
.    ++charCount;
%%

int main(){
    yylex();
    printf("%d %d %d \n", lineCount, wordCount, charCount);
    return 1;
}
