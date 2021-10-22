package com.test.interfaceimpl2;

import java.util.ArrayList;
import java.util.List;

import com.test.interfaceimpl2.StudentVO;

public class StudentManagerImpl implements StudentManager {

	List<StudentVO> list = new ArrayList<>();

	@Override
	public int insert(StudentVO vo) {
		if (isExist(vo)) {
			return -1;
		}
		if (list.add(vo)) {
			return 1;
		}
		return 0;
	}

	@Override
	public StudentVO selectOne(String id) {
		for (StudentVO vo : list) {
			if (vo.getId().equals(id)) {
				return vo;
			}
		}
		return null;
	}

	@Override
	public List<StudentVO> selectList(String name) {
		List<StudentVO> stu = new ArrayList<StudentVO>();
		for (StudentVO students : list) {
			if (students.getName().equals(name)) {
				stu.add(students);
			}
		}
		return stu;
	}

	@Override
	public List<StudentVO> selectAll() {
		return list;
	}

	@Override
	public int update(StudentVO vo) {
		for (StudentVO students : list) {
			if (students.getId().equals(vo.getId())) {
				students.setKor(vo.getKor());
				students.setEng(vo.getEng());
				students.setMath(vo.getMath());
				return 1;
			}
		}
		return 0;
	}

	@Override
	public int delete(String id) {
		for (StudentVO student : list) {
			if (student.getId() == (id)) {
				list.remove(student);
				return 1;
			}
		}
		return 0;
	}

	private boolean isExist(StudentVO vo) {
		for (StudentVO student : list) {
			if (student.getId().equals(vo.getId())) {
				return true;
			}
		}
		return false;
	}

	public void printData() {
		System.out.println(list);
	}

}
