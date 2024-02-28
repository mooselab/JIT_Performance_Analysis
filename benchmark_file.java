public class ArrayDemo {

@Benchmark
public static void main(String[] args) {
        int[] anArray;	       

        anArray = new int[10];	


        for (int i = 0; i < anArray.length; i++) {
            anArray[i] = i;
        }
    
        for (int j = 0; j < anArray.length; j++) {
            System.out.print(anArray[j] + " ");
        }
        System.out.println();
}
    

@Benchmark
public int sum(int a, int b){
        return a + b;
}
    
    
}
