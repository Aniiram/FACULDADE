#include "Frota.h"
#include <iostream>
#include <string>

using namespace std;

Veiculo::Veiculo(string marca, int mes, int ano): marca(marca),mes(mes),ano(ano){}

Motorizado::Motorizado(string marca, int mes, int ano, string combustivel, int cilindrada):
		Veiculo(marca, mes, ano), combustivel(combustivel), cilindrada(cilindrada){}

Automovel::Automovel(string marca, int mes, int ano, string combustivel, int cilindrada):
		Motorizado(marca, mes, ano, combustivel, cilindrada){}

Camiao::Camiao(string marca, int mes, int ano, string combustivel, int cilindrada, int carga_maximam):
		Motorizado(marca, mes, ano, combustivel, cilindrada), carga_maxima(carga_maxima){}

Bicicleta::Bicicleta(string marca, int mes, int ano, string tipo):
		Veiculo(marca, mes, ano), tipo(tipo){}

int Veiculo::info() const
{
	cout << "INFO: " << 3;
	return 3;
}

int Motorizado::info() const
{
	cout << "INFO: " << 2+Veiculo::info();
	return 2+Veiculo::info();
}

int Camiao::info() const
{
	cout << "INFO: " << 1+Motorizado::info();
	return 1+Motorizado::info();
}

int Bicicleta::info() const
{
	cout << "INFO: " << 1+Veiculo::info();
	return 1+Veiculo::info();
}

/*float Veiculo::calcImposto() const
{

}
*/
