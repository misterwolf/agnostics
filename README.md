# Agnostics

## exercise

Il candidato è invitato a scegliere il linguaggio che preferisce per lo svolgimento dei seguenti esercizi. Scelte che valutiamo in via preferenziale sono Javascript e Ruby.

  1. Dato un array di interi, implementare un metodo che li riordini in verso ascendente, senza utilizzare i metodi di sorting forniti dal linguaggio scelto
(come #sort e #sort_by su ruby), e descriverne il funzionamento e la complessità.
  
   - lib/sort_asc.rb.rb

  2. Dato un array di stringhe ordinate, implementare una funzione #search(item) che restituisca la posizione dell’elemento cercato, senza utilizzare i
metodi di ricerca della libreria standard del linguaggio in uso (e.g. #filter su node o #detect su ruby).
  
   - lib/search.rb

  3. Utilizzando le Studio Ghibli API (https://ghibliapi.herokuapp.com) eseguire lo scraping di tutti gli oggetti People appartenenti alla Species “Human” ottimizzando per
velocità d’esecuzione.
  
   - lib/people.rb

  4.	Dato un array con vari livelli di nesting, implementare un metodo che appiattisca l’array senza utilizzare librerie di utilità come lodash o underscore.
Esempio: per l’array [1,[4,5],[2,[3,4]]] il risultato è [1,4,5,2,3,4].
  
   - lib/smooth.rb

## clone repository

`$ git clone git@github.com:misterwolf/agnostics.git`

## initialize project

([install rvm first](https://rvm.io/rvm/install), better)

`$ gem install bundle`

`$ bundle install`

## Run spec

`$ rspec spec/lib/*`

## Run People

`$ ruby lib/people.rb`
