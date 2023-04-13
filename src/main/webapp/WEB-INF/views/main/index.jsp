<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="utf-8" dir="ltr">
<head>
    <meta charset="utf-8">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1">
	<%@ include file ="../include/bHeader.jsp" %>
</head>    
<body>
      <section class="home-section home-parallax home-fade home-full-height bg-dark-30" id="home" data-background="img/dog01.jpg">
        <div class="titan-caption">
          <div class="caption-content">
            <div class="font-alt mb-30 titan-title-size-1">Hello &amp; welcome</div>
            <div class="font-alt mb-40 titan-title-size-4">We are Perro</div>
            <a class="section-scroll btn btn-border-w btn-round" href="#about">Learn More</a>
          </div>
        </div>
      </section>
      
      <div class="main">
        <section class="module" id="about">
          <div class="container">
            <div class="row">
            
              <div class="col-sm-8 col-sm-offset-2">
                <h2 class="module-title font-alt">Welcome to Perro</h2>
               		<div class="module-subtitle font-serif large-text">
                      위 사이트는 이젠아카데미 <br>자바(JAVA) 스프링프레임워크 개발자 양성과정<br>
                      (2022-11-09 ~ 2023-04-12) <br>
                      최진관,이수민의 애견미용샵을 주제로한 졸업 작품 입니다
					</div>
              </div>
              
            </div>
            <div class="row">
              <div class="col-sm-2 col-sm-offset-5">
                <div class="large-text align-center"><a class="section-scroll" href="#services"><i class="fa fa-angle-down"></i></a></div>
              </div>
            </div>
          </div>
        </section>
        <hr class="divider-w">
        
        <section class="module" id="services">
          <div class="container">
            <div class="row">
              <div class="col-sm-6 col-sm-offset-3">
                <h2 class="module-title font-alt">Our Skills</h2>
                <div class="module-subtitle font-serif">"We used [insert programming language] to create our website <br>
                and we feel confident in our ability to handle this technology."</div>
              </div>
                 
              <div class="row">
            </div>
            <div class="row multi-columns-row">
              <div class="col-md-3 col-sm-6 col-xs-12">
                <div class="features-item">
                  <div class="features-icon"><span class="icon-desktop"></span></div>
                  <h3 class="features-title font-alt">Java</h3>
                  
                </div>
              </div>
              <div class="col-md-3 col-sm-6 col-xs-12">
                <div class="features-item">
                  <div class="features-icon"><span class="icon-tablet"></span></div>
                  <h3 class="features-title font-alt">Spring Framework</h3>
                  
                </div>
              </div>
              <div class="col-md-3 col-sm-6 col-xs-12">
                <div class="features-item">
                  <div class="features-icon"><span class="icon-laptop"></span></div>
                  <h3 class="features-title font-alt">HTML</h3>
                  
                </div>
              </div>
              <div class="col-md-3 col-sm-6 col-xs-12">
                <div class="features-item">
                  <div class="features-icon"><span class="icon-paperclip"></span></div>
                  <h3 class="features-title font-alt">GitHub</h3>
                  
                </div>
              </div>
              <div class="col-md-3 col-sm-6 col-xs-12">
                <div class="features-item">
                  <div class="features-icon"><span class="icon-linegraph"></span></div>
                  <h3 class="features-title font-alt">Apache Tomcat</h3>
                  
                </div>
              </div>
              <div class="col-md-3 col-sm-6 col-xs-12">
                <div class="features-item">
                  <div class="features-icon"><span class="icon-genius"></span></div>
                  <h3 class="features-title font-alt">AJAX</h3>
                  
                </div>
              </div>
              <div class="col-md-3 col-sm-6 col-xs-12">
                <div class="features-item">
                  <div class="features-icon"><span class="icon-tools-2"></span></div>
                  <h3 class="features-title font-alt">JSP</h3>
                  
                </div>
              </div>
              <div class="col-md-3 col-sm-6 col-xs-12">
                <div class="features-item">
                  <div class="features-icon"><span class="icon-upload"></span></div>
                  <h3 class="features-title font-alt">AWS</h3>
                </div>
              </div>
              
               <div class="row">
              <div class="col-sm-2 col-sm-offset-5">
                <div class="large-text align-center"><a class="section-scroll" href="#skill"><i class="fa fa-angle-down"></i></a></div>
              </div>
            </div>
            </div>
              
            </div>
          </div>
        </section>
    
        <hr class="divider-w" id="skill">
        <section class="module" id="team">
          <div class="container">
            <div class="row">
              <div class="col-sm-6 col-sm-offset-3">
                <h2 class="module-title font-alt">Meet Our Team</h2>
              </div>
            </div>
            <div class="row" >
              <div class="mb-sm-20 wow fadeInUp col-sm-offset-3 col-md-3" onclick="wow fadeInUp">
                <div class="team-item">
                  <div class="team-image"><img src="assets/images/Beagle.jpg" alt="Member Photo"/>
                  </div>
                  <div class="team-descr font-alt">
                    <div class="team-name">JinGwan Choi</div>
                    <div class="team-role">"Future developer"</div>
                      <div class="team-role" style="text-transform:lowercase;">"gkrjrjrj@naver.com"</div>
                  </div>
                </div>
              </div>
              <div class="mb-sm-20 wow fadeInUp col-md-3">
                <div class="team-item">
                  <div class="team-image"><img src="assets/images/Maltese.jpg" alt="Member Photo"/> 
                  </div>
                  <div class="team-descr font-alt">
                    <div class="team-name">SuMin LEE</div>
                    <div class="team-role">"Future developer"</div>
                    <div class="team-role" style="text-transform:lowercase;">"dltnals5449@naver.com"</div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </section>
       
        <hr class="divider-d">
        </div>
</body>    
<%@ include file="../include/footer.jsp" %>
