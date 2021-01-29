package sungtae.spring.mvc.dao;

import sungtae.spring.mvc.vo.MemberVO;
import sungtae.spring.mvc.vo.ZipcodeVO;

import java.util.List;

public interface MemberDAO {
    int insertMember(MemberVO mvo);

    List<ZipcodeVO> selectZipcode(String dong);

    int selectOneUserid(String uid);

    int selectLogin(MemberVO mvo);
}
