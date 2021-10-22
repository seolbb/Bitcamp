package com.test.interfaceimpl2;

public class StudentVO {
	private String id; // 학번(고유번호: 유일한 데이터 - 중복데이터 없음)
	private String name;
	private int kor;
	private int eng;
	private int math;
	private int tot;
	private double avg;

	public StudentVO(String id, String name, int kor, int eng, int math) {
		super();
		this.id = id;
		this.name = name;
		this.kor = kor;
		this.eng = eng;
		this.math = math;
		computeTotAvg();
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getKor() {
		return kor;
	}

	public void setKor(int kor) {
		if (kor >= 0 && kor <= 100) {
			this.kor = kor;
			computeTotAvg();
		} else {
			System.out.println("[예외발생] 점수가 범위(0~100) 벗어남");
		}
	}

	public int getEng() {
		return eng;
	}

	public void setEng(int eng) {
		if (eng < 0 || eng > 100) {
			System.out.println("[예외발생] 점수가 범위(0~100) 벗어남");
			return;
		}
		this.eng = eng;
		computeTotAvg();
	}

	public int getMath() {
		return math;
	}

	public void setMath(int math) {
		if (math >= 0 && math <= 100) {
			this.math = math;
			computeTotAvg();
		} else {
			System.out.println("[예외발생] 점수가 범위(0~100) 벗어남");
		}
	}

	public int getTot() {
		return tot;
	}

	public void setTot(int tot) {
		this.tot = tot;
	}

	public double getAvg() {
		return avg;
	}

	public void setAvg(double avg) {
		this.avg = avg;
	}

	@Override
	public String toString() {
		return "StudentVO [id=" + id + ", name=" + name + ", kor=" + kor + ", eng=" + eng + ", math=" + math + ", tot="
				+ tot + ", avg=" + avg + "]\n";
	}

	public void computeTotAvg() {
		tot = kor + eng + math;
		avg = (tot * 100) / 3 / 100.0;
	}

}
