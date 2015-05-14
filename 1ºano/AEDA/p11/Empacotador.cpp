#include "Empacotador.h"


ostream& operator<<(ostream& os, Objeto obj) {
	os << "O" << obj.id << ": " << obj.peso;
	return os;
}


int Caixa::ultimoId = 1;

