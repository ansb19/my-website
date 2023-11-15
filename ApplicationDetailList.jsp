<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<%@ page import="dbconn.*" %>
<%     
        String uid = (String) session.getAttribute("sid");
        session.setAttribute("sid",uid);
        String uname = (String) session.getAttribute("sname");
        session.setAttribute("sname",uname);
        String ucert = (String) session.getAttribute("scert");
        session.setAttribute("scert",ucert);
        String utype = (String) session.getAttribute("stype");
        session.setAttribute("stype",utype);
        if(uid == null || uname == null || ucert == null || utype == null ){ //세션 만료시 로그인 화면 이동
        response.sendRedirect(request.getContextPath()+"/menu/login/mainlogin.jsp");
        }
        else{

        
%>
<%
if(request.getParameter("SupportNo") == null) {
    response.sendRedirect(request.getContextPath()+"/menu/Support/ApplicationList.jsp");
} else {
    int SupportNo = Integer.parseInt(request.getParameter("SupportNo"));
    SupportDAO dao = new SupportDAO();
    SupportObject support = dao.selectSupportByKey(SupportNo);

    String filename = support.getFilename();
    String fileroot = support.getFileroot();
    String fileservername = support.getFileservername();
    out.println(fileroot);  %><br><%
    if(fileroot != null && filename != null && fileservername != null){
    fileroot = fileroot.replace(fileservername, "");
    }
    else{
        filename ="파일 없음";
        fileroot ="파일 없음";
        fileservername ="파일 없음";
    }
    
    out.println(filename); %><br><%
    out.println(fileroot);  %><br><%
    out.println(fileservername);    %><br><%
    
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link href="/css/menu1.css?after" rel="stylesheet" type="text/css">
    <link href="/css/footer.css?after" rel="stylesheet" type="text/css">
    <link href="/css/board/ApplicationDetailList.css?after" rel="stylesheet" type="text/css">
        <!--구글웹폰트 Link-->
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Dancing+Script&display=swap" rel="stylesheet">
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap" rel="stylesheet">
        <!--구글웹폰트 Link-->
        <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
        <script type="text/javascript" src="/js/typed.js"></script>
</head>
<body>
<!--s header -->
    <header>
        <div id="h_wrap">
            <div class="menu" >
                <div class="login">
                        <div class="slogin">
                                <% if (uid == null){ // 로그인 안되어 있으므로 로그인과 회원가입이 보임
                            %>
                                <!--구글 번역 API-->
                                
                                <li><div id="google_translate_element" class="hd_lang" style="float: right;position: relative;"></div></li>
                                <script>
                                    function googleTranslateElementInit() {
                                        new google.translate.TranslateElement({
                                            pageLanguage: 'ko',
                                            includedLanguages: 'af,sq,am,ar,hy,as,ay,az,bm,eu,be,bn,bho,bs,bg,ca,ceb,zh-CN,zh-TW,co,hr,cs,da,dv,doi,nl,en,eo,et,ee,fil,fi,fr,fy,gl,ka,de,el,gn,gu,ht,ha,haw,he,hi,hmn,hu,is,ig,ilo,id,ga,it,ja,jv,kn,kk,km,rw,gom,ko,kri,ku,ckb,ky,lo,la,lv,ln,lt,lg,lb,mk,mai,mg,ms,ml,mt,mi,mr,mni-Mtei,lus,mn,my,ne,no,ny,or,om,ps,fa,pl,pt,pa,qu,ro,ru,sm,sa,gd,nso,sr,st,sn,sd,si,sk,sl,so,es,su,sw,sv,tl,tg,ta,tt,te,th,ti,ts,tr,tk,ak,uk,ur,ug,uz,vi,cy,xh,yi,yo,zu',
                                            //layout: google.translate.TranslateElement.InlineLayout.SIMPLE,
                                            autoDisplay: false
                                        }, 'google_translate_element');
                                    }
                                </script>
                                
                                <script src="//translate.google.com/translate_a/element.js?cb=googleTranslateElementInit"></script>               
                                
                                <!--구글 번역 API-->
                                <li><a href="/menu/login/mainlogin.jsp">로그인</a></li>
                                <li><a href="/menu/register/input.jsp">회원가입</a></li>
                            <%  }
                                else{ // 로그인 되어 있으므로 로그아웃 화면이 보임
                            %>
                                <li><div id="google_translate_element" class="hd_lang" style="float: right;position: relative;"></div></li>
                                <script>
                                    function googleTranslateElementInit() {
                                        new google.translate.TranslateElement({
                                            pageLanguage: 'ko',
                                            includedLanguages: 'af,sq,am,ar,hy,as,ay,az,bm,eu,be,bn,bho,bs,bg,ca,ceb,zh-CN,zh-TW,co,hr,cs,da,dv,doi,nl,en,eo,et,ee,fil,fi,fr,fy,gl,ka,de,el,gn,gu,ht,ha,haw,he,hi,hmn,hu,is,ig,ilo,id,ga,it,ja,jv,kn,kk,km,rw,gom,ko,kri,ku,ckb,ky,lo,la,lv,ln,lt,lg,lb,mk,mai,mg,ms,ml,mt,mi,mr,mni-Mtei,lus,mn,my,ne,no,ny,or,om,ps,fa,pl,pt,pa,qu,ro,ru,sm,sa,gd,nso,sr,st,sn,sd,si,sk,sl,so,es,su,sw,sv,tl,tg,ta,tt,te,th,ti,ts,tr,tk,ak,uk,ur,ug,uz,vi,cy,xh,yi,yo,zu',
                                            //layout: google.translate.TranslateElement.InlineLayout.SIMPLE,
                                            autoDisplay: false
                                        }, 'google_translate_element');
                                    }
                                </script>
                                <script src="//translate.google.com/translate_a/element.js?cb=googleTranslateElementInit"></script>   
                                <li><a href="/menu/EditProfile/EditProfile.jsp"><%=uname%></a></li>
                                <li><a href="/controller/logout.jsp">로그아웃</a></li>
                            <%}
                            %>
                            </div>
                        <a href="/mainhomepage.jsp"><img style="width:110px; height:100px;" src="/image/logo.png"></a>
                </div>
                        <nav class="clearfix">
                        <ul class="clearfix">
                        <% if(utype.equals("business")){ %>
                            <li><a href="/menu/Guin/Job-Opening.jsp">구인</a></li> <!--""<-여기 부분에 URL 작성하면 됨-->
                            <li><a href="/menu/Gujik/JobSearch.jsp">구직</a></li>
                            <li><a href="/menu/Review/Review.jsp">기업 리뷰</a></li>
                            <li><a href="/menu/Schedule/ScheduleSearch.jsp">행사 일정</a></li>
                            <li><a href="/menu/Support/ApplicationList.jsp">지원서 목록</a></li>
                            <li><a href="/menu/Resume/Resume.jsp">이력서 목록</a></li>
                            
                        <% } else if(utype.equals("person")){ %>
                            <li><a href="/menu/Guin/Job-Opening.jsp">구인</a></li> <!--""<-여기 부분에 URL 작성하면 됨-->
                            <li><a href="/menu/Gujik/JobSearch.jsp">구직</a></li>
                            <li><a href="/menu/Review/Review.jsp">기업 리뷰</a></li>
                            <li><a href="/menu/Schedule/ScheduleSearch.jsp">행사 일정</a></li>
                            <li><a href="/menu/Support/ApplicationList.jsp">내 지원서 </a></li>
                            <li><a href="/menu/Resume/Resume.jsp">이력서 작성</a></li>
                        <% }  %>
                        </ul>
                        <label for="menuicon" class="menubtn">
                            <span style="background-color:gray"></span>
                            <span style="background-color:gray"></span>
                            <span style="background-color:gray"></span>
                        </label>
                        <a id="pull" href="#"></a>
                        </nav>
            </div>
                    <input type="checkbox" id="menuicon">
                    <div class="container">
                        <div class="sidebar">
                            <span class="area_desc">sidebar영역</span>
                        </div>
                    </div> 
                    <div class="gradient-border">
                    </div>
    </div>
    </header>
<!--e header -->
<!--s main-->
<div id ="wrap">
    <div class="main_wrap">
        <h1>지원서 상세 내용</h1>
        <% 
        if (support.getOpencheck().equals("yes")){ 
            %>
            <div style="height:20px;">
                <div style="width:10%; text-align: center; float:right;">지원열람체크</div>
                <div class="yes"><%=support.getOpencheck()%></div>
            </div>
            <%}
            else {
            %>
            <div style="height: 20px;">
                <div style="width:10%; text-align: center;float:right;">지원열람체크</div>
                <div class="no"><%=support.getOpencheck()%></div>
            </div>
            <% } %>
    </div> 
        <div class="board_write_wrap">
            <div class="board_write">
                <div class="title">
                        <dl>
                            <dt><div class="Pstyle"><p class="Pstyle1">글 번호</p></div></dt>
                            <dd><p style="margin:0 auto;width:95%"><%=support.getNo()%></p></dd>
                            <dt><div class="Pstyle"><p class="Pstyle1">제목</p></div></dt>
                            <dd><p style="margin:0 auto;width:95%"><%=support.getTitle()%></p></dd>
                        </dl>
                        <dl>
                            <dt><div class="Pstyle"><p class="Pstyle1">보낸 사람</p></div></dt>
                            <dd><p style="margin:0 auto;width:95%"><%=support.getSendid()%></p></dd>
                            <dt><div class="Pstyle"><p class="Pstyle1">받은 사람</p></div></dt>
                            <dd><p style="margin:0 auto;width:95%"><%=support.getReceiveid()%></p></dd>
                        </dl>
                        <dl>
                            <dt><div class="Pstyle"><p class="Pstyle1">파일</p></div></dt>
                            <%
                            if(filename.equals("파일 없음") || filename == null || filename.equals("")){
                                
                                %><dd><p style="margin:0 auto;width:95%">파일 없음</p></dd><%
                            } else {
                            %>
                            <dd><p style="margin:0 auto;width:95%"><a style="color:blue" href="<%=request.getContextPath()%>/controller/filedownload.jsp?filename=<%=filename%>&fileroot=<%=fileroot%>&fileservername=<%=fileservername%>"><%=filename%></p></a></dd>
                            <!-- <dd><button onclick="window.location.href='<%=request.getContextPath()%>/controller/filedownload.jsp?filename=<%=filename%>&fileroot=<%=fileroot%>&fileservername=<%=fileservername%>'"><%=filename%></button></dd> --> 
                            <% } %>
                            <dt><div class="Pstyle"><p class="Pstyle1">작성 날짜</p></div></dt>
                            <dd><p style="margin:0 auto;width:95%"><%=support.getDate()%></p></dd><br>
                        </dl>
                        <dl>
                            <dt><div class="Pstyle"><p class="Pstyle1">내용</p></div></dt>
                            <dd><p style="margin:0 auto;width:95%"><%=support.getContent()%></p></dd><br>
                        </dl>
                        <div class="b_button">
                            <a class="reviewbutton" href="<%=request.getContextPath()%>/menu/Support/ApplicationModify.jsp?SupportNo=<%=support.getNo()%>">수정  </a>
                            <!--<a class="reviewbutton" href="<%=request.getContextPath()%>/menu/Support/ApplicationRemove.jsp?SupportNo=<%=support.getNo()%>">삭제</a><br><br>-->
                            <button class="btn-open-popup">삭제</button>
                        </div>
                    
                </div>
            </div>
        </div>
</div>
<!--e main-->
<div class="modal">
    <div class="modal_body">
        <div class="main_wrap1">
            <%  
            if(request.getParameter("SupportNo") == null) {
                response.sendRedirect(request.getContextPath()+"/menu/Support/ApplicationList.jsp");
            } else {
            %>
                <form action="<%=request.getContextPath()%>/controller/SupportRemove.jsp" method="post">
                    <input name="SupportNo" value="<%=request.getParameter("SupportNo")%>" type="hidden"/>
                    <div>비밀번호확인</div>
                    <input  class="pwinput" name="passwd" type="password">
                    <div>
                        <input class="removebutton" type="submit" value="삭제"/>
                        <input class="removebutton" type="reset" value="초기화"/>
                    </div>
                </form>
            <%    
            }
            %>
        </div>
    </div>
  </div>
  <%} }%>
<!--s footer-->
<footer class="Foot_main">
    <div class="g-border">
    </div>
    <div class="user_link">
        <div class="user_box_1">
            <div class="name">
                <p>Kang Jun Hee</p>
            </div>
            <div class="call">
                <p>010-5679-9010</p>
            </div>
            <div class="box_1">
                <a href="https://github.com/ragomm">
                    <img src="/image/Git.png">
                </a>
                <a href="https://www.instagram.com/sh_ragom_j/">
                    <img src="/image/Insta.png">
                </a>
                <a href="https://www.facebook.com/profile.php?id=100009367556652">
                    <img src="/image/Face.png">
                </a>
            </div>
        </div>
        <div class="user_box_2">
            <div class="name">
                <p>Yoon Jeong Hyeon</p>
            </div>
            <div class="call">
                <p>010-7757-6466</p>
            </div>
            <div class="box_2">
                <a href="https://github.com/YJHyeon">
                    <img src="/image/Git.png">
                </a>
                <a href="https://www.instagram.com/iam_jhyeon/">
                    <img src="/image/Insta.png">
                </a>
                <a href="https://www.facebook.com/profile.php?id=100006617160538">
                    <img src="/image/Face.png">
                </a>
            </div>
        </div>
        <div class="user_box_3">
            <div class="name">
                <p>AHN Yeong Seok</p>
            </div>
            <div class="call">
                <p>010-2563-8995</p>
            </div>
            <div class="box_3">
                <a href="https://github.com/ansb19">
                    <img src="/image/Git.png">
                </a>
                <a href="https://www.instagram.com/youngseok_ahn/">
                    <img src="/image/Insta.png">
                </a>
                <a href="https://www.facebook.com/profile.php?id=100005615343484">
                    <img src="/image/Face.png">
                </a>
            </div>
        </div>
    </div>
</footer>
<!--e footer-->
</body>
<script>
    const body = document.querySelector('body');
    const modal = document.querySelector('.modal');
    const btnOpenPopup = document.querySelector('.btn-open-popup');

    btnOpenPopup.addEventListener('click', () => {
      modal.classList.toggle('show');

      if (modal.classList.contains('show')) {
        body.style.overflow = 'hidden';
      }
    });

    modal.addEventListener('click', (event) => {
      if (event.target === modal) {
        modal.classList.toggle('show');

        if (!modal.classList.contains('show')) {
          body.style.overflow = 'auto';
        }
      }
    });
  </script>
</html>