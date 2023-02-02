import java.lang.Math;
import java.time.Duration;

public class calculateRMS {
	static double calculatedResult = 57.735026919;
	
	public static void main(String args[]) {
		int maxArrSize_log = 5; //input
		int maxSampleSize_log = 5; //input
				
		double[][] results_ = new double[5][5];
		
		long start_time = System.nanoTime();
		for (int i = 0; i < maxSampleSize_log; i++) {
			for (int j = 0; j < maxArrSize_log; j++) {
				results_[i][j] = getError(i,j);
			}
		} long end_time = System.nanoTime();
		System.out.println("Time taken: " + (end_time - start_time));
		
		for (int i = 0; i < maxSampleSize_log; i++) {
			System.out.printf("sampleSizeSize = 10^%d: ", i);
			for (int j = 0; j < maxArrSize_log; j++) {
				if (results_[i][j] >= 0) {System.out.printf("%.4f ", (float)results_[i][j]);}
				else {System.out.printf("%.3f ", (float)results_[i][j]);}
			} System.out.println();
		}
	}
	
	public static double rms(double[] arr_) {
		int sum = 0;
		for (double elem: arr_) {
			sum += Math.pow(elem, 2);
		} sum /= arr_.length;
		
		return Math.sqrt(sum);
	}
	
	public static double[] randomArray(int size) {
		double[] randomarr_ = new double[size];
		for (int i = 0; i < size; i++) {
			randomarr_[i] = Math.floor(Math.random() * 100);
		}
		
		return randomarr_;
	}
	
	public static double getError(int sampleSize_log, int arrSize_log) {
		double arrSize = Math.pow(10, arrSize_log);
		double sampleSize = Math.pow(10, sampleSize_log);
		
		double sum = 0;
		for (int i = 0; i < sampleSize; i++) {
			sum += rms(randomArray((int)arrSize));
		} 
		sum /= sampleSize;
		
		double error = (sum - calculatedResult)/calculatedResult;
		
		return error;
	}
}