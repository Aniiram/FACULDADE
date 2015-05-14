#ifndef FROTA_H_
#define FROTA_H_
#include <string>
#include <vector>

using namespace std;


class  Veiculo {
protected:
   string marca;
   int mes, ano;
public:
   Veiculo(string marca, int mes, int ano);
   bool operator < (const Veiculo & v) const;
   //virtual float calcImposto() const = 0;
   string getMarca() const{return marca;};
   virtual int info() const;
};

class Motorizado: public Veiculo {
   string combustivel;
   int cilindrada;
public:
   Motorizado(string marca, int mes, int ano, string combustivel, int cilindrada);
   string getCombustivel() const{return combustivel;};
   virtual int info() const;
   //virtual float calcImposto() const;


};

class Automovel: public Motorizado {
public:
	Automovel(string marca, int mes, int ano, string combustivel, int cilindrada);
	//float calcImposto() const;
};


class Camiao: public Motorizado {
   int carga_maxima;
public:
   Camiao(string marca, int mes, int ano, string combustivel, int cilindrada, int carga_maxima);
   int info() const;
   //float calcImposto() const;

};


class Bicicleta: public Veiculo {
  string tipo;
public:
  	Bicicleta(string marca, int mes, int ano, string tipo);
  	int info() const;
};

class Frota {
	vector<Veiculo *> veiculos;
public:
	int numVeiculos() const;
	void adicionaVeiculo(Veiculo *v1);
	int menorAno() const;
	void info() const;
	float totalImposto() const;
};
#endif /*VEICULO_H_*/
