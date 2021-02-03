package sungtae.spring.mvc.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import sungtae.spring.mvc.dao.PdsDAO;
import sungtae.spring.mvc.vo.BoardVO;
import sungtae.spring.mvc.vo.PdsVO;

import java.util.List;
import java.util.Map;

@Service("psrv")
public class PdsServiceImpl implements PdsService{

    @Autowired
    private PdsDAO pdao;

    @Override
    public boolean newPds(Map<String, String> frmdata, PdsVO pvo) {
        procFormdata(pvo, frmdata);

        int cnt = pdao.insertPds(pvo);

        return true;
    }

    @Override
    public List<PdsVO> readPds(String cp) {
        int snum = (Integer.parseInt(cp) -1 ) * 10;
        return pdao.selectPds(snum);
    }

    @Override
    public int countPds() {
        return pdao.selectCountPds();
    }

    @Override
    public PdsVO readOnePds(String bno) {
        return null;
    }

    @Override
    public boolean viewCountPds(String bno) {
        return false;
    }

    // 폼데이터를 PdsVO에 나눠 담음
    // title : 제목
    // userid : 작성자
    // contents : 본문 내용
    // file1 : 첨부파일명
    // file1size : 첨부파일 크기
    // file1type : 첨부파일 유형
    private void procFormdata(PdsVO p, Map<String, String> frmdata){
        for (String key: frmdata.keySet()){ // Map 으로부터 키를 하나씩 꺼냄
            String val = frmdata.get(key); // 키에 해당하는 값을 알아냄
            switch (key){
                case "title": p.setTitle(val); break;
                case "userid": p.setUserid(val); break;
                case "contents": p.setContents(val); break;
                case "file1": p.setFname1(val); break;
                case "file1size": p.setFsize1(val); break;
                case "file1type": p.setFtype1(val); break;
                case "file2": p.setFname2(val); break;
                case "file2size": p.setFsize2(val); break;
                case "file2type": p.setFtype2(val); break;
                case "file3": p.setFname3(val); break;
                case "file3size": p.setFsize3(val); break;
                case "file3type": p.setFtype3(val); break;
            }
        }
    }
}
