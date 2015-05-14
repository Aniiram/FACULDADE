#include "zoo.h"
#include <iostream>
#include <limits.h>

Veterinario::Veterinario(string nome, long codOrdem): nome(nome),codOrdem(codOrdem){}

int Animal::maisJovem = INT_MAX;

Animal::Animal(string nome, int idade):nome(nome),idade(idade)
{
	vet=NULL;
	if(idade < maisJovem)
		maisJovem = idade;
}

Cao::Cao(string nome, int idade, string raca):Animal(nome, idade),raca(raca){}

Voador::Voador (int velocidade_max, int altura_max):
		velocidade_max(velocidade_max), altura_max(altura_max){}

Morcego::Morcego (string nome, int idade, int velocidade_max, int altura_max):
		Animal(nome,idade), Voador(velocidade_max, altura_max){}

Zoo::Zoo(){}

void Animal::imprime()
{
	cout << "Nome: " << nome << endl;
	cout << "Idade: " << idade << endl;
	cout << "Veterinario: ";

	if(vet != NULL)
		cout << vet << endl;

	else cout << "Veterinário: Nao atribuido" << endl;

	return "true";
}

string Cao::imprime()





string Zoo::imprime()
{
	for(int i=0; i < animais.size(); i++)
		animais[i]->imprime();
}
