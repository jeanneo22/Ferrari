# Declaracao da classe
package Carro;
use parent qw(Automovel);
use Pessoa;
# use Multa;
# use Data;
use strict;
use warnings;
# 3 construtores
sub new {
	my $class = shift;
	# Se tiver parametros e o construtor normal ou o construtor de copia
	if(@_) {
	    # construtor de copia
		if(ref ($_[0])) {
			my $self = $_[0];
			bless($self,$class);
			return $self;
		}
		# construtor com uma lista de parametros
		else {
			my $self = {};
			bless ($self,$class);
			my ( $marchaAtiva,$marchaTotal,$modelo, $velocidadeAtual,$velocidadeMaxima,$dataFabricacao,
				$quantidadePortaTreco,$dinheiroPortaTreco) = @_;
		   $self = $class->SUPER::new($modelo,$velocidadeAtual,$velocidadeMaxima,$dataFabricacao,$quantidadePortaTreco,
		   								$dinheiroPortaTreco);
			# set para validação dos dados
			$self->Carro::marchaAtiva($marchaAtiva);
			$self->Carro::marchaTotal($marchaTotal);
			return ($self);	
		}
	}
	# construtor vazio
	else {
		my $self = {};
		bless($self,$class);
		$self = $class->SUPER::new();
		$self->marchaAtiva(0);
		$self->marchaTotal(0);
		return ($self);
	}
}
# -------------------------------setters e getters---------
sub marchaAtiva {
   my $self = shift;
	# Se tiver uma lista de argumentos e set
    if(@_) {
    	# scalar extrai o tamanho do vetor
    	$self->{marchaAtiva} = ( scalar @_ == 1)?min(max(0,shift),$self->{marchaTotal}):0;
    	return;
    }
    # Senao e get
    else {
    	return $self->{marchaTotal};
    }
}
sub marchaTotal {
	my $self = shift;
    if(@_) {
    	$self->{marchaTotal} = ($_[0] >= 0 && $_[0] < 4 && ( scalar @_) == 1)?shift:0;
    	return;
    }
    else {
    	return $self->{marchaTotal};
    }
}
# minimo entre dois valores
sub min {
	if($_[0] < $_[1]) {return $_[0];}
	else { return $_[1]; }
}
# maximo entre dois valores
sub max {
	if($_[0] > $_[1]) { return $_[1]; }
	else { return $_[0]; }
}
1; # A rotina deve retornar o valor true 