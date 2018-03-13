package roadmodel;


import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import com.alibaba.fastjson.JSON;

public class Test {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		String fn1 = "yanjiuyuan_0313_edgeLists.txt";   // edge file name
		String fn2 = "poseWorldtoLocal_0313.txt";  // pose file name
		String fnrm = "roadmodel.json"; // roadmodel file name
		RMFeeder rf = new RMFeeder();
		RoadModel rm = new RoadModel();
		rf.feed(fn1, fn2, rm);	
		RMChecker rc = new RMChecker();
		if (rc.check(rm))
			System.out.println("pass");
		else
			System.out.println("not pass");
		
		String jsonString = JSON.toJSONString(rm);
		System.out.println(jsonString);
		
		File f = new File(fnrm);
        FileWriter fw=null;
        BufferedWriter bw=null;
        try{
        	if(!f.exists()){
        		f.createNewFile();
            }
            fw=new FileWriter(f.getAbsoluteFile(),true);
            bw=new BufferedWriter(fw);
            bw.write(jsonString);
            bw.close();
        } catch(Exception e) {
        	e.printStackTrace();
        }
	}
}
