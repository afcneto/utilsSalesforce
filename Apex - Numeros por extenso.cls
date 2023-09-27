public class porExtenso {
    private static final map<Long, String> unidades = new map<Long, String> {
        0 => '', 1 => 'Um', 2 => 'Dois', 3 => 'Três', 4 => 'Quatro',
        5 => 'Cinco', 6 => 'Seis', 7 => 'Sete', 8 => 'Oito', 9 => 'Nove', 10 => 'Dez',
        11 => 'Onze', 12 => 'Doze', 13 => 'Treze', 14 => 'Quatorze', 15 => 'Quinze',
        16 => 'Dezesseis', 17 => 'Dezessete', 18 => 'Dezoito', 19 => 'Dezenove'
    };
    private static final map<Long, String> dezenas = new map<Long, String> {
        0 => '', 2 => 'Vinte', 3 => 'Trinta', 4 => 'Quarenta', 5 => 'Cinquenta',
        6 => 'Sessenta', 7 => 'Setenta', 8 => 'Oitenta', 9 => 'Noventa'
    };
    private static final map<Long, String> centenas = new map<Long, String> {
        0 => '', 1 => 'Cento', 2 => 'Duzentos', 3 => 'Trezentos', 4 => 'Quatrocentos', 5 => 'Quinhentos',
        6 => 'Seiscentos', 7 => 'Setecentos', 8 => 'Oitocentos', 9 => 'Novecentos'
    };
    private static final map<Long, String> descPlural = new map<Long, String> {
        0 => ' reais', 1 => ' mil' , 2 => ' milhões' , 3 => ' bilhões',
        4 => ' trilhões', 5 => ' quatrilhões'
    };
    private static final map<Long, String> descSingular = new map<Long, String> {
        0 => '', 1 => ' mil' , 2 => ' milhão' , 3 => ' bilhão',
        4 => ' trilhão', 5 => ' quatrilhão'
    };
                   
	public static String getTotalValue(Decimal value) {
        value = value.setScale(2);
        String extenso ='';
        String fimMilhoes = '';
        String fimMilhares = '';
        String fimUnidades = '';
        Integer valorInteiro = (Integer)value.setScale(0);
        //resto = Math.mod(value,1000000);
        Integer milhoes = valorInteiro / 1000000;
        Integer mod = Math.mod(valorInteiro, 1000000);

        if(milhoes == 1){
            extenso += 'Um Milhão';
        }
        if(milhoes > 1){
            if(milhoes < 20) extenso += unidades.get(milhoes) +  ' ' + descPlural.get(2);
            else{
                Integer centMilhoes = milhoes / 100;
                String cem = Math.mod(milhoes, 100) == 0 ? 'Cem' : centenas.get(centMilhoes);
                if(Math.mod(milhoes, 100) < 20) fimMilhoes = unidades.get(Math.mod(milhoes, 100));
                else{
                    fimMilhoes += dezenas.get(Math.mod(milhoes, 100) / 10);
                    if((Math.mod(milhoes, 100) / 10) != 0 && Math.mod(milhoes, 10) != 0) fimMilhoes += ' e '; 
                    if(Math.mod(milhoes, 10) != 0) fimMilhoes += unidades.get(Math.mod(milhoes, 10));
                }
                String conector1 = '';
                if(centMilhoes != 0 && (Math.mod(milhoes, 100) / 10) != 0) conector1 = ' e ';
                extenso += cem + conector1 + fimMilhoes + descPlural.get(2);
            }
        }
        if(extenso != '') extenso += ', ';
        Integer milhares = mod / 1000;        
        mod = Math.mod(valorInteiro, 1000);
        if(milhares == 1) extenso +=  'Um ' + descSingular.get(1);
        if(milhares > 1){
            if (milhares < 20) extenso += unidades.get(milhares) + ' ' + descSingular.get(1);
            else{
                Integer centMilhares = milhares / 100;
                String cem = Math.mod(milhares, 100) == 0 ? 'Cem' : centenas.get(centMilhares);
                if(Math.mod(milhares, 100) < 20) fimMilhares = unidades.get(Math.mod(milhares, 100));
                else{
                    fimMilhares += dezenas.get(Math.mod(milhares, 100) / 10);
                    if((Math.mod(milhares, 100) / 10) != 0 && Math.mod(milhares, 10) != 0) fimMilhares += ' e '; 
                    if(Math.mod(milhares, 10) != 0) fimMilhares += unidades.get(Math.mod(milhares, 10));
                }
                String conector1 = ' ';
                if(centMilhares != 0 && (Math.mod(milhares, 100) / 10) != 0) conector1 = ' e ';
                extenso += cem + conector1 + fimMilhares + descPlural.get(1);  
            }
        }
        //mod--;
        if(milhares != 0 && mod != 0) extenso += ', ';
        if(mod == 0) extenso += ' reais';
        if(mod == 1) extenso += 'Um real';
        if(mod > 1){
            if(mod < 20) extenso += unidades.get(mod) + ' reais';
            else{
                Integer centUnid = mod / 100;
                String cem = Math.mod(mod, 100) == 0 ? 'Cem' : centenas.get(centUnid);
                if(Math.mod(mod, 100) < 20) fimUnidades = unidades.get(Math.mod(mod, 100));
                else{
                    fimUnidades += dezenas.get(Math.mod(mod, 100) / 10);
                    if((Math.mod(mod, 100) / 10) != 0 && Math.mod(mod, 10) != 0) fimUnidades += ' e '; 
                    if(Math.mod(mod, 10) != 0) fimUnidades += unidades.get(Math.mod(mod, 10));
                }
                String conector1 = ' ';
                if(centUnid != 0 && (Math.mod(mod, 100)) != 0) conector1 = ' e ';
                extenso += cem + conector1 + fimUnidades + descPlural.get(0);
            }            
        }
        //Numeros decimais
        String s = String.valueOf(value);
        Integer centavos = Integer.valueOf(s.substringAfter('.'));
        if(centavos != 0 && centavos != null){
            extenso += ' e '; 
            if(centavos == 1) extenso += 'Um centavo';
            else{
                if(centavos < 20) extenso += unidades.get(centavos) + ' centavos';
                else{
                    Integer dezCentavos = Math.mod(centavos, 100) / 10;
                    Integer unidCentavos = Math.mod(centavos, 10);
                    String conector1 = ' ';
                    if(unidCentavos != 0 && dezCentavos != 0) conector1 = ' e ';
                    extenso += dezenas.get(dezCentavos) + conector1 + unidades.get(unidCentavos) + ' centavos';            
                    
                }
            }
        }
        extenso = extenso.toLowerCase().capitalize();

        return extenso;
    }
}