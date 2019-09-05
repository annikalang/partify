const highlighter = () => {

  // Selecting the pathname of each window of your site
  const path = document.location.pathname;

  // Selecting all navbar items
  const iconLink = document.querySelector('.iconlink');
  const iconLink1 = document.querySelector('.iconlink1');
  const iconLink2 = document.querySelector('.iconlink2');
  const iconLink3 = document.querySelector('.iconlink3');

  // Selecting all the active navbar items i.e highlighted
  const iconLinkActive = document.querySelector('.iconlink.active');
  const iconLink1Active = document.querySelector('.iconlink1.active1');
  const iconLink2Active = document.querySelector('.iconlink2.active2');
  const iconLink3Active = document.querySelector('.iconlink3.active3');

  // Below we remove the active class from all the iconLinks

  iconLink.classList.remove('active');
  iconLink1.classList.remove('active1');
  iconLink2.classList.remove('active2');
  iconLink3.classList.remove('active3');


  // Below we set the condition that if the documents pathname is
  // equal to the pathname of the selected element, then add a class

  if (path === iconLink.pathname) {
    iconLink.parentElement.classList.add('active');
  };

  if (path === iconLink1.pathname) {
    iconLink1.parentElement.classList.add('active1');
  };

  if (path === iconLink2.pathname) {
    iconLink2.parentElement.classList.add('active2');
  };

  if (path === iconLink3.pathname) {
    iconLink3.parentElement.classList.add('active3');
  };

};

export { highlighter };
