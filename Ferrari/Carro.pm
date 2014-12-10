# Declaracao da classe
package Carro;
use parent qw(Automovel);
use Pessoa;
use Multa;
use Data;
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
			$self->Automovel::modelo($modelo);
			$self->Automovel::velocidadeMaxima($velocidadeMaxima);
			$self->Automovel::velocidadeAtual($velocidadeAtual);
			$self->{dataFabricacao} = new Data($dataFabricacao);
			$self->Automovel::quantidadePortaTreco($quantidadePortaTreco);
			$self->Automovel::dinheiroPortaTreco($dinheiroPortaTreco);
			return ($self);	
		}
	}
	# construtor vazio
	else {
		my $self = {};
		bless($self,$class);
		$self->Automovel::modelo("");
		$self->Automovel::velocidadeMaxima(0.0);
		$self->Automovel::velocidadeAtual(0.0);
		$self->{dataFabricacao} = new Data();
		$self->Automovel::quantidadePortaTreco(0);
		$self->Automovel::dinheiroPortaTreco(0);
		return ($self);
	}
}
# -------------------------------setters e getters---------
sub modelo {
   my $self = shift;
	# Se tiver uma lista de argumentos e set
    if(@_) {
    	# scalar extrai o tamanho do vetor
    	$self->{modelo} = ( scalar @_ == 1)?shift:"";
    	return;
    }
    # Senao e get
    else {
    	return $self->{modelo};
    }
}
sub velocidadeMaxima {
	my $self = shift;
    if(@_) {
    	$self->{velocidadeMaxima} = ($_[0] >= 0.0 && ( scalar @_) == 1)?shift:0.0;
    	return;
    }
    else {
    	return $self->{velocidadeMaxima};
    }
}
sub velocidadeAtual {
	my $self = shift;
    if(@_) {
    	$self->{velocidadeAtual} = ($_[0] >= 0.0 && (scalar @_)==1)?shift:0.0;
    	return;
    }
    else {
    	return $self->{peso};
    }
	
}
sub quantidadePortaTreco {
   my $self = shift;
	# Se tiver uma lista de argumentos e set
    if(@_) {
    	# scalar extrai o tamanho do vetor
    	$self->{quantidadePortaTreco} = ( $_[0] >= 0 && scalar @_ == 1)?shift:0;
    	return;
    }
    # Senao e get
    else {
    	return $self->{quantidadePortaTreco};
    }
}
sub dinheiroPortaTreco {
	my $self = shift;
    if(@_) {
    	$self->{dinheiroPortaTreco} = ($_[0] >= 0.0 && ( scalar @_) == 1)?shift:0.0;
    	return;
    }
    else {
    	return $self->{dinheiroPortaTreco};
    }
}
1; # A rotina deve retornar o valor true 