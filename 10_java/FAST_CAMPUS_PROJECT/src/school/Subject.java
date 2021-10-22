package school;

import java.util.ArrayList;

public class Subject {
	// 과목이름, 과목 고유번호, 과목 평가 방법:기본은 A,B 방식
	private String subjectName;
	private int subjectId;
	private int gradeType;
	private ArrayList<Student> studentList = new ArrayList<Student>();
	
	public String getSubjectName() {
		return subjectName;
	}
	public void setSubjectName(String subjectName) {
		this.subjectName = subjectName;
	}
	public int getSubjectId() {
		return subjectId;
	}
	public void setSubjectId(int subjectId) {
		this.subjectId = subjectId;
	}
	public int getGradeType() {
		return gradeType;
	}
	public void setGradeType(int gradeType) {
		this.gradeType = gradeType;
	}
	public ArrayList<Student> getStudentList() {
		return studentList;
	}
	public void setStudentList(ArrayList<Student> studentList) {
		this.studentList = studentList;
	}
	
	
	public Subject(String subjectName, int subjectId) {
		super();
		this.subjectName = subjectName;
		this.subjectId = subjectId;
	}
	
	public void register(Student student) {
		studentList.add(student);
	}
	
	
	
	}
