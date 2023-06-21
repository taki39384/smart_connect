function post (){
  const submit = document.getElementById("submit_btn");
  submit.addEventListener("click", (e) => { 
    const formData = new FormData(document.getElementById("new_article"));
    const XHR = new XMLHttpRequest();
    XHR.open("POST", "/articles", true);
    XHR.responseType = "json";
    XHR.send(formData);
    XHR.onload = () => {
      if (XHR.status != 200) { 
        alert(`Error ${XHR.status}: ${XHR.statusText}`);
        return null;
      };
      const item = XHR.response.article;
      const contentsArea = document.getElementById("contents_area");
      const articleText = document.getElementById("article_text");
      const HTML = `
        <div class="article">
          ${ item.text }
        </div>`;
      contentsArea.insertAdjacentHTML("afterbegin", HTML);
      articleText.value = "";
    };
    e.preventDefault();
  });
}
window.addEventListener('load', post);