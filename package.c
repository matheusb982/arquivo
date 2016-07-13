#include<stdio.h>
#include<stdlib.h>

int main(){
int n = 0, b1, b2, b3, aux, result;

printf("Digite o numero de caixas: \n");
scanf("%d", &n);

int vet[n];

for(int i = 0 ;i<n;i++){
    printf("Digite o volume da caixa %d: ", i);
    scanf("%d", &vet[i]);
}

printf("Digite o volume do pacote: ");
scanf("%d", &result);

//vet[0] = 3960;
//vet[1] = 13875;
//vet[2] = 35150;

int pack;
while(result>=vet[n]){
pack = result;
result = 0;
    if(pack<=vet[0]){
        b1 = b1+1;
    }else if(pack>=vet[0] && pack<=vet[1]){
        b2 =b2+1;
    }else if(pack>=vet[1] && pack<=vet[2]){
        b3 = b3+1;
    }

    if(pack>vet[2]){
        for(int i=3-1; i >= 1; i--) {
            for( int j=0; j < i ; j++){
                if(vet[j]<vet[j+1]){
                    aux = vet[j];
                    vet[j] = vet[j+1];
                    vet[j+1] = aux;
                }
            }
        }
        for(int i=0; i<3; i++){
                if(i == 0){
                    result = pack - vet[i];
                    b3 = b3+1;
                }
        }
        for(int i=3-1; i >= 1; i--) {
            for( int j=0; j < i ; j++){
                if(vet[j]>vet[j+1]){
                    aux = vet[j];
                    vet[j] = vet[j+1];
                    vet[j+1] = aux;
                }
            }
        }
        if(result<=vet[0]){
            b1 = b1+1;
        }else if(result>=vet[0] && result<=vet[1]){
            b2 =b2+1;
        }else if(result>=vet[1] && result<=vet[2]){
            b3 = b3+1;
        }
    }
}


printf("b1: %d\n", b1);
printf("b2: %d\n", b2);
printf("b3: %d\n", b3);




return 0;
}
