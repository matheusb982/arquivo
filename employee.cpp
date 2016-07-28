#include <iostream>
#include <fstream>
#include <string>
#include <vector>
using namespace std;

struct Employee{
	int numFunc, id;
	string name, department;
	float value;
};

void imprimefunc(Employee f)
{
	cout << "ID: "<<f.id<<endl;
	cout << "NOME: "<<f.name<<endl;
	cout << "VALOR: "<<f.value<<endl;
	cout << "DEPARTAMENTO: "<<f.department<<endl;
}

int main(){
	std::ifstream ifs;
	
	ifs.open("funcionarios.txt", std::ifstream::in);
	
	int numFunc, id;
	string name, department;
	float value;
	
	ifs >> numFunc;
	cout << "Num. Funcionario: " << numFunc << endl;
	
	vector<Employee> funcs;
	
	while(ifs.good())
	{
		ifs >> id >> name >> value >> department;
		
		cout << "ID: "<<id<<endl;
		cout << "NOME: "<<name<<endl;
		cout << "SALARIO: "<<value<<endl;
		cout << "DEPARTAMENTO: "<<department<<endl;
		
		Employee f;
		f.id = id;
		f.name = name;
		f.value = value;
		f.department = department;
		
		funcs.push_back(f);
	}
	
	for(int i=0; i<funcs.size(); i++){
		imprimefunc(funcs[i]);
	}
	
	float soma=0;
	for(int i=0;i<funcs.size();i++)
	{
		soma += funcs[i].value;
	}
		
	float media = soma / funcs.size();
	
	ofstream saida("estatistica.txt", ofstream::out);
	saida << "Media: " << media << endl;
	
	ifs.close();
	
}
