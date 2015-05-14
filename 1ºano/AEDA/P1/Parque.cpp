#include "Parque.h"
#include <vector>

using namespace std;

ParqueEstacionamento::ParqueEstacionamento(unsigned int lot, unsigned int n_max_clientes):
num_max_clientes (n_max_clientes), lotacao(lot)
{
	num_clientes=0;
	vagas = lot;
};

unsigned int ParqueEstacionamento::num_lugares() const
{
	return lotacao;
};

unsigned int ParqueEstacionamento::maximo_clientes() const
{
	return num_max_clientes;
};

int ParqueEstacionamento::posicao_cliente(const string & nome) const
{
	for ( int i=0 ; i < clientes.size() ; i++)
	{
		if ( clientes[i].nome == nome )
		return i;
	}
	return -1;
};

bool ParqueEstacionamento::novo_cliente(const string & nome)
{
	if (num_clientes < num_max_clientes)
		{
			InfoCartao I1;
			I1.nome = nome;
			I1.presente = false;
			clientes.push_back (I1);
			num_clientes++;
			return true;
		}
	else return false;
};
