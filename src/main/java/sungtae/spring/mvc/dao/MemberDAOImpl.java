package sungtae.spring.mvc.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import sungtae.spring.mvc.vo.MemberVO;
import sungtae.spring.mvc.vo.ZipcodeVO;

import java.util.List;

@Repository("mdao")
public class MemberDAOImpl implements MemberDAO {

    @Autowired
    private SqlSession sqlSession;

    @Override  // 회원정보 추가
    public int insertMember(MemberVO mvo) {
        return sqlSession.insert("member.insertMember", mvo);
    }

    @Override  // 우편번호 조회
    public List<ZipcodeVO> selectZipcode(String dong) {
        return sqlSession.selectList("member.zipcode", dong);
    }

    @Override
    public int selectOneUserid(String uid) {
        return sqlSession.selectOne("member.checkuid", uid);
    }

    @Override
    public int selectLogin(MemberVO mvo) {
        return sqlSession.selectOne("member.checklogin", mvo);
    }
}
