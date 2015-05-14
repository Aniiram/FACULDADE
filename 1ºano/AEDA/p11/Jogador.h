#ifndef JOGADOR_H_
#define JOGADOR_H_

#include "Aposta.h"
#include <string>

using namespace std;


//A ALTERAR!!
struct apostaHash
{
	int operator() (const Aposta & ap) const
	{
		return -1;
	}
	
	bool operator() (const Aposta & ap1, const Aposta & ap2) const
	{
		return true;
	}
};

typedef tr1::unordered_set<Aposta, apostaHash, apostaHash> HashApostas;

class Jogador
{
	HashApostas apostas;
	string nome;
public:
	Jogador(string nm="anonimo") { nome=nm; }
	int getNumApostas() const { return apostas.size(); }
	//void adicionaAposta(const Aposta & ap);
	//int apostasNoNumero(int num) const;
	//HashApostas apostasSorteadas(const tr1::unordered_set<int> & sorteio) const;
};

#endif /*JOGADOR1_H_*/
