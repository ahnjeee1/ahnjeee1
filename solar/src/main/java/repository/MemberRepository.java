package repository;

import java.util.List;

import entity.Member;

public interface MemberRepository {
	List<Member> getMemberList();
	void insertMember(Member member);
	Member selectOne(String id);
	void updateMember(Member member);
	public void deleteMember(Member member);
}
