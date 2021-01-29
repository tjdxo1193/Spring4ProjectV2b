package sungtae.spring.mvc.service;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import sungtae.spring.mvc.dao.MemberDAO;
import sungtae.spring.mvc.vo.MemberVO;

import javax.servlet.http.HttpSession;

@Service("msrv")
public class MemberServiceImpl implements MemberService {

    @Autowired
    private MemberDAO mdao;

    @Override
    public String newMember(MemberVO mvo) {
        String result = "회원가입 실패!";
        int cnt = mdao.insertMember(mvo);
        if (cnt > 0) result = "회원가입 성공!!";
        return result;
    }

    @Override // 동이름으로 우편번호 검색
    public String findZipcode(String dong) {
        // 조회결과 출력방법 1 : csv (쉼표로 구분)
        // 서울, 강남구, 논현동, 123번지

        // 조회결과 출력방법 2 : xml
        // <zip><sido>서울</sido> <gugun>강남구</gugun>
        //      <dong>논현동</dong> <bunji>123번지</bunji></zip>

        // 조회결과 출력방법 3 : json (추천)
        // {'sido':'서울', 'gugun':'강남구',
        //  'dong':'논현동', 'bunji':'123번지'}

        // StringBuilder sb = new StringBuilder();
        // sb.append("{'sido':").append("'서울',")
        // .append("'gugun':").append("'강남구',")
        // .append("'dong':").append("'논현동',")
        // .append("'bunji':").append("'123번지',");
        // .append("}");

        // 코드로 json 형태로 결과물을 만들려면 상당히 복잡함
        // ObjectMapper 라이브러리를 이용하면
        // 손쉽게 JSON 유형의 데이터를 생성할 수 있음
        ObjectMapper mapper = new ObjectMapper();
        String json = "";

        dong = dong + "%";
        try {
            json = mapper.writeValueAsString(
                    mdao.selectZipcode(dong) );
        } catch (JsonProcessingException e) {
            e.printStackTrace();
        }
        // 검색한 주소데이터를 json형식으로 변환

        return json;
    }

    @Override
    public String checkUserid(String uid) {
        String isOk = "0";

        int cnt = mdao.selectOneUserid(uid);
        if (cnt > 0) isOk = "1";

        return isOk;
    }

    @Override // 로그인 체크
    public boolean checkLogin(MemberVO mvo, HttpSession sess) {
        boolean isLogin = false;

        // 로그인 성공시 회원정보를 세션에 저장
        // 회원 아이디/비밀번호가 member 테이블에 있는지 확인
        // 있으면 : 1 을 반환, 없으면 : 0 을 반환
        if (mdao.selectLogin(mvo) > 0){
            sess.setAttribute("UID", mvo.getUserid());
            isLogin = true;
        }

        return isLogin;
    }

}
