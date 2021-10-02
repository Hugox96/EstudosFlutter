///Distribui um valor em várias porcentagens
List<double> distribute(value, percentages){
  List<double> result = [];
  for (int i = 0; i < percentages.length; ++i){
    result.add(value*percentages[i]/100);
  }
  return result;
}

///Calcula a diferença percentual entre dois valores
double percentageChange(former, present){
  return (present - former)*100/former;
}