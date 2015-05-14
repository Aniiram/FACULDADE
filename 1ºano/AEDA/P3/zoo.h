/*
  zoo.h
 */

#ifndef ZOO_H_
#define ZOO_H_

#include <string>
#include <vector>
#include <iostream>
using namespace std;


class Veterinario {
	string nome;
	long codOrdem;
	//...
public:
	Veterinario(string nome, long codOrdem);
	string imprime();
	//...
};

class Animal {
protected:
	string nome;
	int idade;
	Veterinario *vet;
	static int maisJovem;
public:
	Animal (string nome, int idade);
	string getNome(){return nome;};
	virtual string imprime();  // imprime nome e idade do animal e nome do veterinário
	//virtual bool eJovem() const = 0;
	static int getMaisJovem(){return maisJovem;};
};



class Cao: public Animal {
	string raca;
public:
	Cao(string nome, int idade, string raca);
	string imprime();
	//...
};



class Voador {
	int velocidade_max;
	int altura_max;
public:
	Voador (int velocidade_max, int altura_max);
	virtual string imprime();  // imprime valor de velocidade e altitude máxima
	//...
};



class Morcego: public Animal, public Voador {
public:
	Morcego (string nome, int idade, int velocidade_max, int altura_max);
	string imprime();
	//...
};


class Zoo {
	vector<Animal *> animais;
	vector<Veterinario *> veterinarios;
public:
	Zoo ();
	void adicionaAnimal(Animal *a1){animais.push_back(a1);};
	string imprime();
	bool animalJovem(string nomeA);
	void alocaVeterinarios(istream &isV);
	bool removeVeterinario(string nomeV);
	bool operator < (Zoo& zoo2) const;
	int numAnimais() {return animais.size();};
};


#endif /* ZOO_H_ */
