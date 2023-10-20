import React, { useState, useEffect } from 'react';
import '../assets/bootstrap/css/bootstrap.min.css';
import '../assets/css/animate.min.css'
import { useNavigate } from 'react-router-dom';
import { DELETE_TOKEN, SET_TOKEN } from '../store/Auth';


function Header() {
    const navigate = useNavigate();
    const navigateToCat = () => {
        navigate("/sweetalert");
    };
    const navigateToMain = () => {
        navigate("/main");
    };
    const navigateToSchedule = () => {
        navigate("/schedule");
    };
    const navigateToList = () => {
        navigate("/notice");
    };
    const navigateToHrm = () => {
        navigate("/hrm");
    };
    const navigateToApprovalList = () => {
        navigate("/approval");
    };
    const navigateToEmpList = () => {
        navigate("/emp")
    };
    const navigateLogout = () => {
        // 쿠키 이름을 지정하세요. 로그인 세션에서 사용한 쿠키 이름을 여기에 입력해야 합니다.
        const cookieName = "Authorization";

        // 쿠키를 삭제하기 위해 현재 날짜 이전의 날짜를 만듭니다.
        const pastDate = new Date(0);

        // 쿠키를 삭제하는 코드
        document.cookie = `${cookieName}=; expires=${pastDate.toUTCString()}; path=/`;

        // 로그아웃 후 로그인 페이지로 이동
        window.location.href = '/login'


    }

    const [isMobile, setIsMobile] = useState(false);
    const [hoverAnimationList, setHoverAnimationList] = useState([]);



    useEffect(() => {
        const getWidth = () => {
            return window.innerWidth;
        };

        setIsMobile(getWidth() < 768);

        const elements = document.querySelectorAll('[data-bss-hover-animate]');
        setHoverAnimationList(elements);

        elements.forEach((element) => {
            element.addEventListener('mouseenter', () => {
                element.classList.add('animated', element.dataset.bssHoverAnimate);
            });
            element.addEventListener('mouseleave', () => {
                element.classList.remove('animated', element.dataset.bssHoverAnimate);
            });
        });
    }, []);
    if (window.location.pathname === '/login') return null;

    return (
        <div>
            <div>
                <div className="d-lg-flex align-items-lg-center justify-content-xxl-start" style={{width: 'auto', height: '50px', background: '#000000'}}><button className="btn btn-primary" data-bss-hover-animate="pulse" type="button" onClick={ navigateToMain } style={{borderStyle: 'none', background: 'rgba(128,128,128,0)', height: '50px', borderRadius: '0px', width: '317.9844px'}}>엄용민프로덕션</button>
                    <div style={{height: 'auto', width: '400px'}} />
                    <div className="d-lg-flex justify-content-lg-end justify-content-xxl-start" style={{height: 'auto', width: '100%'}}>
                        <div className="btn-group d-lg-flex justify-content-lg-center" role="group" style={{height: 'auto', width: 'auto', fontSize: '14px', maxHeight: 'none', maxWidth: 'none'}}><button className="btn btn-primary text-nowrap" data-bss-hover-animate="pulse" type="button" style={{borderStyle: 'none', background: 'rgba(0,0,0,0)'}}>회원관리</button><button className="btn btn-primary text-nowrap" data-bss-hover-animate="pulse" type="button" onClick={ navigateToSchedule } style={{borderStyle: 'none', background: 'rgba(0,0,0,0)'}}>일정</button><button className="btn btn-primary text-nowrap" data-bss-hover-animate="pulse" type="button" onClick={ navigateToList } style={{borderStyle: 'none', background: 'rgba(0,0,0,0)'}}>게시판</button><button className="btn btn-primary text-nowrap" data-bss-hover-animate="pulse" type="button" onClick={navigateToEmpList} style={{borderStyle: 'none', background: 'rgba(0,0,0,0)'}}>재무관리</button><button className="btn btn-primary text-nowrap" data-bss-hover-animate="pulse" type="button" onClick={ navigateToHrm } style={{borderStyle: 'none', background: 'rgba(0,0,0,0)'}}>인사관리</button><button className="btn btn-primary text-nowrap" data-bss-hover-animate="pulse" type="button" onClick={ navigateToApprovalList } style={{borderStyle: 'none', background: 'rgba(0,0,0,0)'}}>결재</button><button className="btn btn-primary text-nowrap" data-bss-hover-animate="pulse" type="button" style={{borderStyle: 'none', background: 'rgba(0,0,0,0)'}}>콘텐츠관리</button></div>
                    </div>
                    <div className="d-lg-flex justify-content-lg-end" style={{height: 'auto', width: '100%'}}><button className="btn btn-primary text-nowrap" type="button" onClick={ navigateLogout } style={{borderStyle: 'none', background: 'rgba(0,0,0,0)', width: '90px'}}>로그아웃</button></div>
                </div>
            </div>
        </div>
    )
};

export default Header;