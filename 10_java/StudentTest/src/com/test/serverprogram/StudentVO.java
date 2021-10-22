package com.test.serverprogram;

public class StudentVO {
	private String name;
	private int kor;
	private int eng;
	private int math;
	private int tot;
	private double avg;

	public StudentVO(String name, int kor, int eng, int math) {
		super();
		this.name = name;
		this.kor = kor;
		this.eng = eng;
		this.math = math;
		computeTotAvg();
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
		if (eng >= 0 && eng <= 100) {
			this.eng = eng;
			computeTotAvg();
		} else {
			System.out.println("[예외발생] 점수가 범위(0~100) 벗어남");
		}
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

	public double getAvg() {
		return avg;
	}

	// computeTotAvg() 메소드 작성 : 과목합계, 평균계산 처리
	private void computeTotAvg() {
		this.tot = kor + eng + math;
		avg = tot * 100 / 3 / 100.0;

	}

	// toString() 작성 ---------------------------
	@Override // 메소드의 오버라이드(override)
	public String toString() {
		return "StudentVO [name=" + name + ", kor=" + kor + ", eng=" + eng + ", math=" + math + ", tot=" + tot
				+ ", avg=" + avg + "]";
	}

	public void printData() {
		System.out.println(name + "\t" + kor + "\t" + eng + "\t" + math + "\t" + tot + "\t" + avg);
	}
	
	public void printData2() {
		System.out.println(name + "\t" + tot + "\t" + avg);
	}

}
