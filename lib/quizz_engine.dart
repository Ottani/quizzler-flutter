import 'package:flutter/material.dart';

class QuizzEngine {
  int _currQuestion = -1;
  int _rightAnswers = 0;

  List<Question> _questions;

  QuizzEngine() {
    reset();
  }

  Question getNextQuestion() {
    ++_currQuestion;
    _questions[_currQuestion].answers.shuffle();
    return _questions[_currQuestion];
  }

  List<Widget> getButtons(void Function(bool answer) checkOnPressed) {
    return _questions[_currQuestion]
        .answers
        .map((a) => Expanded(
              child: Padding(
                padding: EdgeInsets.all(10.0),
                child: FlatButton(
                  textColor: Colors.white,
                  color: Colors.blue,
                  child: Text(
                    a.text,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                    ),
                  ),
                  onPressed: () {
                    print(a.isCorrect);
                    checkOnPressed(a.isCorrect);
                  },
                ),
              ),
            ))
        .toList(growable: false);
  }

  bool checkAnswer(bool isCorrect) {
    if (isCorrect) {
      ++_rightAnswers;
      return true;
    }
    return false;
  }

  bool hasNextQuestion() {
    return (_currQuestion < _questions.length - 1);
  }

  int getScore() {
    return ((_rightAnswers / _questions.length) * 10.0).round();
  }

  void reset() {
    _currQuestion = -1;
    _rightAnswers = 0;
    allQuestions.shuffle();
    _questions = allQuestions.take(5).toList(growable: false);
  }
}

class Question {
  final String text;
  final List<Answer> answers;

  const Question(this.text, this.answers);
}

class Answer {
  final String text;
  final bool isCorrect;

  const Answer(this.text, this.isCorrect);
}

final List<Question> allQuestions = [
  Question(
    'Normalmente, quantos litros de sangue uma pessoa tem?',
    <Answer>[
      Answer('Tem entre 2 a 4 litros', false),
      Answer('Tem entre 4 a 6 litros', true),
      Answer('Tem 10 litros.', false),
      Answer('Tem 7 litros.', false),
      Answer('Tem 0,5 litros.', false),
    ],
  ),
  Question(
    'De quem é a famosa frase “Penso, logo existo”?',
    <Answer>[
      Answer('Platão', false),
      Answer('Galileu Galilei', false),
      Answer('Descartes', true),
      Answer('Sócrates', false),
      Answer('Francis Bacon', false),
    ],
  ),
  Question(
    'De onde é a invenção do chuveiro elétrico?',
    <Answer>[
      Answer('França', false),
      Answer('Inglaterra', false),
      Answer('Brasil', true),
      Answer('Austrália', false),
      Answer('Itália', false),
    ],
  ),
  Question(
    'Quais o menor e o maior país do mundo?',
    <Answer>[
      Answer('Vaticano e Rússia', true),
      Answer('Nauru e China', false),
      Answer('Mônaco e Canadá', false),
      Answer('Malta e Estados Unidos', false),
      Answer('São Marino e Índia', false),
    ],
  ),
  Question(
    'Qual o nome do presidente do Brasil que ficou conhecido como Jango?',
    <Answer>[
      Answer('Jânio Quadros', false),
      Answer('Jacinto Anjos', false),
      Answer('Getúlio Vargas', false),
      Answer('João Figueiredo', false),
      Answer('João Goulart', true),
    ],
  ),
  Question(
    'Qual o livro mais vendido no mundo a seguir à Bíblia?',
    <Answer>[
      Answer('O Senhor dos Anéis', false),
      Answer('Dom Quixote', true),
      Answer('O Pequeno Príncipe', false),
      Answer('Ela, a Feiticeira', false),
      Answer('Um Conto de Duas Cidades', false),
    ],
  ),
  Question(
    'Quantas casas decimais tem o número pi?',
    <Answer>[
      Answer('Duas', false),
      Answer('Centenas', false),
      Answer('Infinitas', true),
      Answer('Vinte', false),
      Answer('Milhares', false),
    ],
  ),
  Question(
    'Atualmente, quantos elementos químicos a tabela periódica possui?',
    <Answer>[
      Answer('113', false),
      Answer('109', false),
      Answer('108', false),
      Answer('118', true),
      Answer('92', false),
    ],
  ),
  Question(
    'Quais os países que têm a maior e a menor expectativa de vida do mundo?',
    <Answer>[
      Answer('Japão e Serra Leoa', true),
      Answer('Austrália e Afeganistão', false),
      Answer('Itália e Chade', false),
      Answer('Brasil e Congo', false),
      Answer('Estados Unidos e Angola', false),
    ],
  ),
  Question(
    'O que a palavra legend significa em português?',
    <Answer>[
      Answer('Legenda', false),
      Answer('Conto', false),
      Answer('História', false),
      Answer('Lenda', true),
      Answer('Legendário', false),
    ],
  ),
  Question(
    'Qual o número mínimo de jogadores numa partida de futebol?',
    <Answer>[
      Answer('8', false),
      Answer('10', false),
      Answer('9', false),
      Answer('5', false),
      Answer('7', true),
    ],
  ),
];

/*


Question(
'',
<Answer>[
Answer('', false),
Answer('', false),
Answer('', false),
Answer('', false),
Answer('', false),
],
),

13. Quais os principais autores do Barroco no Brasil?
a) Gregório de Matos, Bento Teixeira e Manuel Botelho de Oliveira
b) Miguel de Cervantes, Gregório de Matos e Danthe Alighieri
c) Padre Antônio Vieira, Padre Manuel de Melo e Gregório de Matos
d) Castro Alves, Bento Teixeira e Manuel Botelho de Oliveira
e) Álvares de Azevedo, Gregório de Matos e Bento Teixeira


Alternativa a: Gregório de Matos, Bento Teixeira e Manuel Botelho de Oliveira.

Gregório de Mato (1633-1696), conhecido como Boca do Inferno, é o maior representante do Barroco no Brasil. Tinha esse apelido devido às críticas sociais contidas na sua poesia.

Bento Teixeira (1561-1618) é o autor do poema Prosopopeia, publicado em 1601, que é considerado o marco inicial do Barroco brasileiro.

Manuel Botelho de Oliveira (1636-1711), um dos grandes representantes do Barroco, é autor do livro Música do Parnaso, publicado em Lisboa quando o autor tinha quase 70 anos. Trata-se da sua obra com maior destaque.

14. Quais as duas datas que são comemoradas em novembro?
a) Independência do Brasil e Dia da Bandeira
b) Proclamação da República e Dia Nacional da Consciência Negra
c) Dia do Médico e Dia de São Lucas
d) Dia de Finados e Dia Nacional do Livro
e) Black Friday e Dia da Árvore


Alternativa b: Proclamação da República e Dia Nacional da Consciência Negra.

A Proclamação da República é comemorada no dia 15 de novembro, data em que Marechal Deodoro da Fonseca proclamou a república em 1889.

O Dia Nacional da Consciência Negra é comemorado no dia 20 de novembro, data em que Zumbi dos Palmares morreu, em 1695.


15. Quem pintou "Guernica"?
a) Paul Cézanne
b) Pablo Picasso
c) Diego Rivera
d) Tarsila do Amaral
e) Salvador Dalí


Alternativa b: Pablo Picasso.

Pablo Picasso (1881-1973) pintou Guernica, uma das suas obras de maior destaque, em 1937. A pintura feita em óleo sobre tela retrata o bombardeio à cidade espanhola Guernica em 26 de abril de 1937, aquando da Guerra Civil Espanhola.

16. Quanto tempo a luz do Sol demora para chegar à Terra?
a) 12 minutos
b) 1 dia
c) 12 horas
d) 8 minutos
e) segundos


Alternativa d: 8 minutos.

Essa é uma questão que se fundamenta na ótica. Ela é calculada com base na distância do Sol em relação à Terra, que é de aproximadamente 150 000 000 km, considerando que a velocidade da luz no vácuo é 300 000 Km/s.

150 000 000 dividido por 300 000 é igual a 500 segundos, ou seja, 8,33 minutos.

17. Qual a tradução da frase “Fabiano cogió su saco antes de salir”?
a) Fabiano coseu seu paletó antes de sair
b) Fabiano fechou o saco antes de sair
c) Fabiano pegou seu paletó antes de sair
d) Fabiano cortou o saco antes de cair
e) Fabiano rasgou seu paletó antes de cair


Alternativa c: Fabiano pegou seu paletó antes de sair.

Apesar da grafia e da pronúncia semelhantes, saco em espanhol, significa paletó em português.

Este é um dos falsos cognatos mais conhecidos da língua espanhola. Outros exemplos são: apellido, que significa sobrenome, e embarazada, que significa grávida.

18. Qual a nacionalidade de Che Guevara?
a) Cubana
b) Peruana
c) Panamenha
d) Boliviana
e) Argentina


Alternativa e: Argentina.

Conhecido como um dos líderes da Revolução Cubana, ao lado dos irmãos Fidel e Raúl Castro, Ernesto Guevara de La Serna nasceu em Rosário, Argentina, no dia 14 de junho de 1928.

19. Quais são os três predadores do reino animal reconhecidos pela habilidade de caçar em grupo, se camuflar para surpreender as presas e possuir sentidos apurados, respectivamente:
a) Tubarão branco, crocodilo e sucuri
b) Tigre, gavião e orca
c) Hiena, urso branco e lobo cinzento
d) Orca, onça e tarântula
e) Leão, tubarão branco e urso cinzento


Alternativa c: Hiena, urso branco e lobo cinzento.

A hiena é o único animal que enfrenta o leão, atacando-o quando estão em grupo. Enquanto isso, o urso branco, ou urso polar, se camufla entre o gelo do Ártico. O urso cinzento, por sua vez, tem excelentes audição e visão noturna, características que fazem dele grandes caçadores.

20. Qual a altura da rede de vôlei nos jogos masculino e feminino?
a) 2,4 para ambos
b) 2,5 m e 2,0 m
c) 1,8 m e 1,5 m
d) 2,45 m e 2,15 m
e) 2,43 m e 2,24 m


Alternativa e: 2,43 m e 2,24 m.

Antigamente, a altura era de 1,98 m. Atualmente é 2,43 m para jogadores adultos masculinos e 2,24 m para jogadores adultos femininos. A altura da rede também varia de acordo com a idade dos jogadores.

21. Em que ordem surgiram os modelos atômicos?
a) Thomson, Dalton, Rutherford, Rutherford-Bohr
b) Rutherford-Bohr, Rutherford, Thomson, Dalton
c) Dalton, Rutherford-Bohr, Thomson, Rutherford
d) Dalton, Thomson, Rutherford-Bohr, Rutherford
e) Dalton, Thomson, Rutherford, Rutherford-Bohr


Alternativa e: Dalton, Thomson, Rutherford, Rutherford-Bohr.

Ao logo dos tempos, os modelos atômicos evoluíram. O Modelo atômico de Dalton foi proposto em 1803. Em 1898 foi a vez de Thomson apresentar o seu modelo. Em 1911, Rutherford mostrou a sua proposta. Pouco depois, baseado no modelo de Rutherford, o cientista Niels Bohr aprimorou um modelo que apresentou em 1913, o Modelo atômico de Rutherford-Bohr.

22. Qual personagem folclórico costuma ser agradado pelos caçadores com a oferta de fumo?
a) Caipora
b) Saci
c) Lobisomem
d) Boitatá
e) Negrinho do Pastoreio


Alternativa a: Caipora.

Considerada a protetora da floresta, a Caipora assusta os caçadores, os quais levam-lhe fumo de corda. O fumo é deixado junto a um tronco de árvore com o intuito de agradar a Caipora para, assim, os caçadores poderem caçar.

23. Em que período da pré-história o fogo foi descoberto?
a) Neolítico
b) Paleolítico
c) Idade dos Metais
d) Período da Pedra Polida
e) Idade Média


Alternativa b: Paleolítico.

Foi no Paleolítico que o fogo começou a ser utilizado, quando os homens aprenderam que era possível obter fogo por meio do atrito de pedaços de madeira e pedra.

24. Qual das alternativas abaixo apenas contêm classes de palavras?
a) Vogais, semivogais e consoantes
b) Artigo, verbo transitivo e verbo intransitivo
c) Fonologia, Morfologia e Sintaxe
d) Hiatos, ditongos e tritongos
e) Substantivo, verbo e preposição


Alternativa e: Substantivo, verbo e preposição.

Classes de palavras são palavras que se organizam de acordo com as suas funções na língua portuguesa. Existem 10 classes de palavras: substantivo, verbo, preposição, adjetivo, pronome, artigo, numeral, conjunção, interjeição e advérbio.

25. Qual a montanha mais alta do Brasil?
a) Pico da Neblina
b) Pico Paraná
c) Monte Roraima
d) Pico Maior de Friburgo
e) Pico da Bandeira


Alternativa a: Pico da Neblina.

O Pico da Neblina é o ponto mais elevado do Brasil, contando com 2995 metros de altura. Localiza-se no Amazonas, na fronteira com a Venezuela e a Colômbia.

26. Qual a velocidade da luz?
a) 300 000 000 metros por segundo (m/s)
b) 150 000 000 metros por segundo (m/s)
c) 199 792 458 metros por segundo (m/s)
d) 299 792 458 metros por segundo (m/s)
e) 30 000 000 metros por segundo (m/s)


Alternativa d: 299 792 458 metros por segundo (m/s).

A primeira medição real da luz foi feita pelo astrônomo Ole Romer, que em 1676 chegou a um número próximo da velocidade da luz. Hoje, sabe-se com precisão que a velocidade da luz é 299 792 458 metros por segundo.

27. Em qual local da Ásia o português é língua oficial?
a) Índia
b) Filipinas
c) Moçambique
d) Macau
e) Portugal


Alternativa d: Macau.

Macau tem duas línguas oficiais, mandarim e português. Macau, uma região especial da China, foi território português até 1999.

28. “It is six twenty ou twenty past six”. Que horas são em inglês?
a) 12:06
b) 6:20
c) 2:20
d) 6:02
e) 12:20


Alternativa b: 6:20.

Em inglês, “past” é usado para indicar até 29 minutos passados de uma determinada hora. A partir de trinta minutos, é usada a expressão “half past”: It is half past eight. ou It is eight thirty.

29. Quem é o autor de “O Príncipe”?
a) Maquiavel
b) Antoine de Saint-Exupéry
c) Montesquieu
d) Thomas Hobbes
e) Rousseau


Alternativa a: Maquiavel.

O Príncipe é a obra mais célebre de Nicolau Maquiavel (1469-1527). Foi publicada postumamente, em 1532, apesar de ter sido concluída em 1513.


30. Como é a conjugação do verbo caber na 1.ª pessoa do singular do presente do indicativo?
a) Eu caibo
b) Ele cabe
c) Que eu caiba
d) Eu cabo
e) Nenhuma das alternativas


Alternativa a: Eu caibo.

Caber é um verbo irregular da 2ª conjugação. Apesar de estranho, “eu caibo” é a forma correta de conjugá-lo na 1ª pessoa do presente do indicativo.

31. Quais destas construções famosas ficam nos Estados Unidos?
a) Estátua da Liberdade, Golden Gate Bridge e Empire State Building
b) Estátua da Liberdade, Big Ben e The High Line
c) Angkor Wat, Taj Mahal e Skywalk no Grand Canyon
d) Lincoln Memorial, Sidney Opera House e Burj Khalifa
e) 30 St Mary Axe, The High Line e Residencial 148 Spruce Street


Alternativa a: Estátua da Liberdade, Golden Gate Bridge e Empire State Building.

A Estátua da Liberdade, localizada na Ilha da Liberdade em Manhattan, Nova York, pode ser vista de vários locais, graças a sua altura, que é de 92,99 metros.

Golden Gate Bridge, localizada em São Francisco, na Califórnia, é o principal cartão postal da cidade.

Empire State Building, localizada em Manhattan, Nova York, mais precisamente na Quinta Avenida, é um arranha-céu de 102 andares.

32. Quais destas doenças são sexualmente transmissíveis?
a) Aids, tricomoníase e ebola
b) Chikungunya, aids e herpes genital
c) Gonorreia, clamídia e sífilis
d) Botulismo, cistite e gonorreia
e) Hepatite B, febre tifoide e hanseníase


Alternativa c: Gonorreia, clamídia e sífilis.

Gonorreia e clamídia são infecções sexualmente transmissíveis (IST) causadas por bactérias, que podem atingir além dos órgãos genitais, a garganta e os olhos.

Sífilis também é uma infecção sexualmente transmissível, cujo principal sintoma é uma ferida no pênis, vulva, vagina, colo uterino, ânus, boca, ou outros locais da pele.

33. Qual destes países é transcontinental?
a) Rússia
b) Filipinas
c) Istambul
d) Groenlândia
e) Tanzânia


Alternativa a: Rússia.

A Rússia, cujo nome oficial é Federação Russa, é o maior país em extensão territorial do mundo. Essa nação é transcontinental, pois pertence a mais de um continente: Europa e Ásia.

34. Em qual das orações abaixo a palavra foi empregada incorretamente?
a) Mais uma vez, portou-se mal.
b) É um homem mal.
c) Esse é o mal de todos.
d) Mal falou nele, o fulano apareceu.
e) É um mau vendedor.


Alternativa b: É um homem mal.

“Mal” e “mau” são duas palavras homófonas, ou seja, são pronunciadas da mesma maneira, porém escritas de maneiras diferentes. A palavra mal com “l” é antônima de bem; já a palavra mau com “u” é antônimo de bom.

35. Qual foi o recurso utilizado inicialmente pelo homem para explicar a origem das coisas?
a) A Filosofia
b) A Biologia
c) A Matemática
d) A Astronomia
e) A Mitologia


Alternativa e: A Mitologia.

A mitologia é um sistema de crenças que inclui uma série de narrativas e lendas, as quais fizeram parte do imaginário coletivo de diversas civilizações antigas. Dessa forma, no começo do desenvolvimento da humanidade, diversos povos utilizaram a mitologia para explicar alguns fenômenos e a origem das coisas.

36. Qual das alternativas menciona apenas símbolos nacionais?
a) Bandeira insígnia da presidência, bandeira nacional, brasão, hinos e selo
b) Bandeira nacional, armas nacionais, hino nacional e selo nacional
c) Bandeira nacional, brasão, hino nacional e hino da independência
d) Bandeira nacional, cores nacionais, hino nacional e hino da independência
e) Bandeira insígnia da presidência, brasão flora e fauna e hinos


Alternativa b: Bandeira nacional, armas nacionais, hino nacional e selo nacional.

Os Símbolos Nacionais são: a bandeira nacional, as armas nacionais ou brasão da república, o selo nacional e o hino nacional. Implementados pela Lei n° 5.700, de 1º de setembro de 1971, juntos, eles representam a união do nosso país.

37. Quais os planetas do sistema solar?
a) Terra, Vênus, Saturno, Urano, Júpiter, Marte, Netuno, Mercúrio
b) Júpiter, Marte, Mercúrio, Netuno, Plutão, Saturno, Terra, Urano, Vênus
c) Vênus, Saturno, Urano, Júpiter, Marte, Netuno, Mercúrio
d) Júpiter, Marte, Mercúrio, Netuno, Plutão, Saturno, Sol, Terra, Urano, Vênus
e) Terra, Vênus, Saturno, Júpiter, Marte, Netuno, Mercúrio


Alternativa a: Terra, Vênus, Saturno, Urano, Júpiter, Marte, Netuno, Mercúrio.

O Sistema Solar é formado por oito planetas: Terra, Vênus, Saturno, Urano, Júpiter, Marte, Netuno, Mercúrio. Além disso, ele é constituído por dezenas de satélites naturais, milhares de asteroides, meteoros, meteoroides e cometas que giram em torno do Sol.

38. Qual era o nome de Aleijadinho?
a) Alexandrino Francisco Lisboa
b) Manuel Francisco Lisboa
c) Alex Francisco Lisboa
d) Francisco Antônio Lisboa
e) Antônio Francisco Lisboa


Alternativa e: Antônio Francisco Lisboa.

Aleijadinho (1730-1814), apelido de Antônio Francisco Lisboa, foi um dos maiores representantes do barroco brasileiro. Recebeu essa alcunha pois foi acometido por uma doença que deformou sua mãos e pés. No entanto, mesmo nessas condições, continuou trabalhando como escultor, entalhador, carpinteiro e arquiteto.

39. Júpiter e Plutão são os correlatos romanos de quais deuses gregos?
a) Ares e Hermes
b) Cronos e Apolo
c) Zeus e Hades
d) Dionísio e Deméter
e) Zeus e Ares


Alternativa c: Zeus e Hades.

Na mitologia romana, Júpiter tem Zeus como seu correlato grego. Ele é considerado o pai dos deuses, sendo o deus dos céus, da chuva, da luz e do raio. Já Plutão, tem Hades como seu correlato grego, o deus do submundo e dos infernos.

40. Qual o maior animal terrestre?
a) Baleia Azul
b) Dinossauro
c) Elefante africano
d) Tubarão Branco
e) Girafa


Alternativa c: Elefante africano.

O elefante africano é o maior animal terrestre. Ele pode medir até 4 metros de altura e 7 de comprimento. Seu peso pode chegar até 8 toneladas.

41. Qual o tema do famoso discurso Eu Tenho um Sonho, de Martin Luther King?
a) Igualdade das raças
b) Justiça para os menos favorecidos
c) Intolerância religiosa
d) Prêmio Nobel da Paz
e) Luta contra o Apartheid


Alternativa a: Igualdade das raças.

Martin Luther King Jr. (1929-1968) foi um líder e ativista político que lutou contra a discriminação racial nos Estados Unidos. Em 1963, na “Marcha sobre Washington”, que reuniu 250 mil pessoas, proferiu o seu célebre discurso “Eu tenho um sonho” (I Have a Dream).

42. Que líder mundial ficou conhecida como “Dama de Ferro”?
a) Dilma Rousseff
b) Angela Merkel
c) Margaret Thatcher
d) Hillary Clinton
e) Christine Lagarde


Alternativa c: Margaret Thatcher.

Margaret Thatcher (1925-2013), conhecida como a “dama de ferro”, foi a primeira-ministra britânica e a primeira mulher a ocupar este posto. Ela esteve nesta posição entre os anos de 1979 e 1990 e seu governo teve como principal característica a implantação do neoliberalismo no Reino Unido. Contrária ao socialismo, ela realizou um discurso em 1976 contra a URSS e, por conta disso, os soviéticos passaram a chamá-la de “dama de ferro”.

43. O que são Acordo de Paris e Tríplice Aliança respectivamente?
a) Acordo ortográfico entre países cuja língua oficial é o francês e Acordo de cooperação financeira internacional entre as três maiores potências mundiais
b) Acordo entre países europeus acerca da imigração e Acordo econômico entre Inglaterra, Rússia a França
c) Acordo entre vários países acerca das consequências do aquecimento global e Acordo de cooperação financeira internacional entre as três maiores potências mundiais
d) Acordo de cooperação financeira internacional entre as três maiores potências mundiais e Acordo entre vários países acerca das consequências do aquecimento global
e) Acordo entre vários países acerca das consequências do aquecimento global e Acordo entre Alemanha, império Austro-Húngaro e Itália acerca de apoio em caso de guerra


Alternativa e: Acordo entre vários países acerca das consequências do aquecimento global e Acordo entre Alemanha, império Austro-Húngaro e Itália acerca de apoio em caso de guerra.

O Acordo de Paris, adotado durante a Conferência das Partes, em Paris, no ano de 2015, representa um compromisso internacional entre 195 países que tem como objetivo minimizar as consequências do aquecimento global.

Já a Tríplice Aliança, criada em 1882, com o objetivo de proteção e apoio em caso de guerra, foi um acordo econômico, político e militar entre Alemanha, o império Austro-Húngaro e a Itália.


44. Quais os nomes dos três Reis Magos?
a) Gaspar, Nicolau e Natanael
b) Belchior, Gaspar e Baltazar
c) Belchior, Gaspar e Nataniel
d) Gabriel, Benjamim e Melchior
e) Melchior, Noé e Galileu


Alternativa b: Belchior, Gaspar e Baltazar.

Os três reis magos são personalidades que visitaram Jesus após o seu nascimento. Eles ofereceram alguns itens como forma de presentear a chegada do Salvador. Assim, Belchior levou ouro, Gaspar, incenso, e Baltazar, mirra.

45. Quais os principais heterônimos de Fernando Pessoa?
a) Alberto Caeiro, Ricardo Reis e Álvaro de Campos
b) Ariano Suassuna, Raul Bopp e Quincas Borba
c) Bento Teixeira, Ricardo Reis e Haroldo de Campos
d) Alberto Caeiro, Ricardo Leite e Augusto de Campos
e) Bento Teixeira, Ricardo Reis e Augusto de Campos


Alternativa a: Alberto Caeiro, Ricardo Reis e Álvaro de Campos.

Os Heterônimos de Fernando Pessoa são personalidades criadas por ele próprio e que possuem vidas independentes, com biografia e estilo particular. Embora ele tenha criado muitos durante sua vida, os três principais são: Alberto Caeiro, Ricardo Reis e Álvaro de Campos.

46. Qual a religião monoteísta que conta com o maior número de adeptos no mundo?
a) Judaísmo
b) Zoroastrismo
c) Islamismo
d) Cristianismo
e) Hinduísmo


Alternativa d: Cristianismo.

Baseado na fé em Jesus Cristo, o filho de Deus, o Cristianismo é a religião com maior número de fiéis no mundo, com aproximadamente 2 bilhões de seguidores.

47. Qual desses filmes foi baseado na obra de Shakespeare?
a) Muito Barulho por Nada (2012)
b) Capitães de Areia (2011)
c) A Dama das Camélias (1936)
d) A Revolução dos Bichos (1954)
e) Excalibur (1981)


Alternativa a: Muito Barulho por Nada (2012).

Muitos filmes foram baseados na obra do poeta, ator e dramaturgo William Shakespeare (1564-1616). Muito Barulho por Nada (2012) é uma comédia baseada na peça homônima de Shakespeare. O filme, que retrata a história do casamento entre Hero e Cláudio, foi dirigido por Joss Whedon.

48. Quem foi o primeiro homem a pisar na Lua? Em que ano aconteceu?
a) Yuri Gagarin, em 1961
b) Buzz Aldrin, em 1969
c) Charles Conrad, em 1969
d) Charles Duke, em 1971
e) Neil Armstrong, em 1969.


Alternativa e: Neil Armstrong, em 1969.

Neil Armstrong (1930-2012) foi um engenheiro e astronauta, sendo o primeiro homem a pisar na lua em 1969 na missão Apollo 11, ao lado dos astronautas: Michael Collins e Edwin 'Buzz' Aldrian.

49. Qual o nome do cientista que descobriu o processo de pasteurização e a vacina contra a raiva?
a) Marie Curie
b) Blaise Pascal
c) Louis Pasteur
d) Antoine Lavoisier
e) Charles Darwin


Alternativa c: Louis Pasteur.

Louis Pasteur (1822-1895) foi um cientista francês que descobriu, em 1862, o processo de esterilização de alimentos, conhecido como pasteurização. Além disso, em 1885 ele descobriu a vacina antirrábica, ao tratar de um garoto que foi mordido por um cão.

50. As pessoas de qual tipo sanguíneo são consideradas doadores universais?
a) Tipo A
b) Tipo B
c) Tipo O
d) Tipo AB
e) Tipo ABO


Alternativa c: Tipo O.

No Sistema ABO, existem quatro tipos sanguíneos: A, B, AB e O. O sangue O doa para todos os outros tipos (A,B,AB e O), entretanto, somente recebe de O. Por isso, ele é considerado o doador universal.

51. Quais são os cromossomos que determinam o sexo masculino?
a) Os V
b) Os X
c) Os Y
d) Os W
e) Os Z


Alternativa c: Os Y.

Os cromossomos sexuais são dois: o “X” é o cromossomo feminino e “Y”, o cromossomo masculino.

52. Em que estado australiano fica situada a cidade de Sydney?
a) Nova Gales do Sul
b) Victoria
c) Tasmânia
d) Queensland
e) Norfolk


Alternativa a: Nova Gales do Sul.

Sydney é a capital do estado australiano de Nova Gales do Sul, sendo a cidade mais populosa da Austrália com cerca de 5 milhões de habitantes.

53. Que organização juvenil foi fundado por Baden-Powell?
a) A juventude socialista
b) O escotismo
c) O clube dos aventureiros
d) A associação juvenil
e) A Organização mundial da juventude


Alternativa b: o escotismo.

Criado em 1907 por Robert Stephenson Smyth Baden-Powell, o escotismo é um movimento sem fins lucrativos voltado para a educação e o desenvolvimento de jovens.

54. Quem amamentou os gêmeos Rômulo e Remo?
a) uma cabra
b) uma vaca
c) uma ovelha
d) uma gata
e) uma loba


Alternativa e: uma loba.

Na mitologia Romana, Rômulo e Remo são dois irmãos gêmeos que foram alimentados por uma loba quando bebês. Filhos do Rei Marte e de Reia, quando nasceram, eles foram lançados em um rio para morrerem afogados, no entanto, foram encontradas por uma loba que passou a amamentá-los.

55. No exterior de que famoso edifício francês foi construída uma enorme pirâmide de vidro em 1989?
a) Torre Eiffel
b) Petit Palais
c) Grand Palais
d) Museu do Louvre
e) Arco do Triunfo


Alternativa d: Museu do Louvre.

O museu do Louvre, localizado em Paris no Palácio do Louvre, é o maior museu de arte do mundo e um dos monumentos mais visitados na cidade.

A pirâmide de vidro e aço, situada na frente do museu, foi construída entre os anos de 1985 e 1989. Essa obra foi encomendada em 1984 pelo Presidente François Mitterrand e teve como arquiteto o chinês Ieoh Ming Pei.

56. Como se chamam os vasos que transportam sangue do coração para a periferia do corpo?
a) veias
b) átrios
c) ventrículos
d) artérias
e) aurículos


Alternativa d: artérias.

As artérias são um tipo de vasos sanguíneos que transportam o sangue arterial (com oxigênio e nutrientes) do coração para o corpo.

57. Com que dois países faz fronteira o Equador?
a) com o Brasil e com a Colômbia
b) com a Colômbia e com a Venezuela
c) com a Colômbia e com o Peru
d) com o Peru e com o Equador
e) com o Equador e o Brasil


Alternativa c: com a Colômbia e com o Peru.

O Equador é um país localizado na costa leste da América do Sul, onde faz fronteira com a Colômbia e o Peru.

58. Que animal gruguleja?
a) o pavão
b) a garça
c) o papagaio
d) a cacatua
e) o peru


Alternativa e: o peru.

Grugulejar é o som emitido pelo peru.


59. Qual é o maior arquipélago da Terra?
a) a Filipinas
b) a Indonésia
c) as Bahamas
d) a Finlândia
e) as Maldivas


Alternativa b: A Indonésia.

A Indonésia é um país localizado entre a Ásia e a Oceania, e tem como capital Jacarta. Considerado o maior arquipélago do mundo, o país reúne 17508 ilhas.

60. Que substância é absorvida pelas plantas e expirada por todos os seres vivos?
a) o oxigênio
b) o nitrogênio
c) o nitrato de sódio
d) o dióxido de ferro
e) o dióxido de carbono


Alternativa e: o dióxido de carbono.

O dióxido de carbono (CO2), popularmente chamado de gás carbônico, é uma molécula composta por um átomo de carbono (C) e dois de oxigênio (O). As plantas absorvem dióxido de carbono (CO2) do ar e o transformam no processo de fotossíntese. Já os animais, inspiram oxigênio (O2) e expiram dióxido de carbono (CO2).

61. Em que oceano fica Madagascar?
a) Oceano Índico
b) Oceano Antártico
c) Oceano Atlântico
d) Oceano Pacífico
e) Oceano Ártico


Alternativa a: Oceano Índico.

Madagascar é um país insular banhado pelo Oceano Índico. Localizado no sudeste da África, sua capital é Antananarivo.

62. Que artista é conhecido como um dos expoentes máximos do Ready-Mades?
a) Pablo Picasso
b) Salvador Dalí
c) Marcel Duchamp
d) Van Gogh
e) Leonardo da Vinci


Alternativa c: Marcel Duchamp.

Marcel Duchamp (1887-1968) foi um renomado pintor e escultor francês. Dentre todas suas criações, sem dúvida, os ready-mades são o maior destaque. Tratam-se de objetos prontos e banais que foram esvaziados de sua função prática. Seu ready-made mais famoso foi “A Fonte”, de 1917, um urinol assinada por “R. Mutt” e apresentado como uma obra de arte.

63. Qual o metal cujo símbolo químico é o Au?
a) Cobre
b) Prata
c) Mercúrio
d) Ouro
e) Manganês


Alternativa d: Ouro.

O ouro é um metal de transição presente na tabela periódica, sendo representado pelo símbolo Au.

64. Em que século o continente europeu foi devastado pela peste bubônica?
a) No século X
b) No século XI
c) No século XII
d) No século XIII
e) No século XIV


Alternativa e: No século XIV.

A peste bubônica, também chamada de peste negra, atingiu a população europeia no século XIV, sendo que o auge da epidemia ocorreu entre os anos de 1347 e 1353. Estima-se que ⅓ da população morreu afetada por essa doença pulmonar, ou seja, cerca de 25 milhões de pessoas.

65. Quem viveu, segundo a bíblia, 969 anos?
a) Jesus Cristo
b) Noé
c) Matusalém
d) Benjamim
e) Abel


Alternativa c: Matusalém.

Segundo o Livro dos Gênesis, Matusalém era filho de Enoque e viveu por 969 anos, sendo assim, o homem mais velho da Bíblia: “E foram todos os dias de Matusalém novecentos e sessenta e nove anos, e morreu.” (Gênesis 5:27)

66. Em que cidade ocorreu a Eco-92, a Conferência das Nações Unidas sobre ambiente e desenvolvimento?
a) Buenos Aires
b) Rio de Janeiro
c) Montevidéu
d) Assunção
e) Caracas


Alternativa b: Rio de Janeiro.

Com o intuito de discutir sobre os problemas ambientais do planeta, a Eco-92 foi organizada pela ONU - Organização das Nações Unidas, e realizada entre os dias 3 e 14 de junho de 1992, na cidade do Rio de Janeiro.

67. Quem pintou o teto da capela sistina?
a) Michelangelo
b) Leonardo da Vinci
c) Rafael
d) Sandro Botticelli
e) Donatello


Alternativa a: Michelangelo.

Michelangelo (1475-1564) foi um pintor, escultor e arquiteto italiano. Ele é o responsável por pintar, durante os anos 1508 e 1512, o teto da Capela Sistina, no Vaticano.

68. Quantos graus são necessário para que dois ângulos sejam complementares?
a) 45
b) 60
c) 90
d) 180
e) 360


Alternativa c: 90.

Os ângulos complementares são ângulos que juntos somam 90º.

69. Quem foi o criador da tragédia grega?
a) Homero
b) Eurípedes
c) Plutarco
d) Ésquilo
e) Sófocles


Alternativa d: Ésquilo.

Ésquilo foi um dramaturgo da Grécia antiga que ficou conhecido com o pai da tragédia. De suas obras, destacam-se: Os Persas, Sete contra Tebas e a trilogia A Oresteia (Agamenon, As Coéforas e As Eumênides).

70. Jim Morrison era vocalista de que grupo?
a) The Police
b) The Doors
c) Pink Floyd
d) Nirvana
e) AC/DC

Alternativa b: The Doors.


Continue praticando com exercícios:

Conhecimentos gerais e atualidades
Conhecimentos gerais para concurso
Jogos de conhecimentos gerais
Charadas matemáticas divertidas com resposta

Este conteúdo foi útil?SimNão
Márcia Fernandes
Márcia Fernandes
Professora, pesquisadora, produtora e gestora de conteúdos on-line. Licenciada em Letras pela Universidade Católica de Santos.

VEJA TAMBÉM
Conhecimentos gerais e atualidades
Jogos de conhecimentos gerais (com Quiz)
Adivinhas
Conhecimentos gerais para concurso
18 charadas de matemática com resposta
Geografia do Brasil
Exercícios de interpretação de texto
Exercícios de crase
LEITURA RECOMENDADA
Conhecimentos gerais e atualidades
Jogos de conhecimentos gerais (com Quiz)
Conhecimentos gerais para concurso
Adivinhas
Trava-Línguas
Tabela Periódica
TÓPICOS RELACIONADOS
Exercícios


Recomendados Para Você
1,6 bilhões de dólares? A maior loteria do mundo chega no Brasil!
theLotter.com
O que é, o que é: 126 adivinhas com respostas
Mulheres maduras encontraram um novo site de namoro para paquerar!
Your Dating Sites
40 perguntas de conhecimentos gerais e atualidades
A gordura da barriga pode reduzir drasticamente usando isto. Confira!
Drenefort
Jogos de conhecimentos gerais (com Quiz)
por taboolaLinks promovidos

 Como Citar Contato Política de Privacidade Sobre Todas as Matérias Populares RSS FeedArtigo revisado em 27/05/20
Toda Matéria: conteúdos escolares.
© 2011-2020 7Graus


Márcia Fernandes
Professora, pesquisadora, produtora e gestora de conteúdos on-line. Licenciada em Letras pela Universidade Católica de Santos.

Fernandes, Márcia: Perguntas e respostas de conhecimentos gerais. Toda Matéria, 2020. Disponível em: https://www.todamateria.com.br/perguntas-e-respostas-de-conhecimentos-gerais/.

 */
