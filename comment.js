function loadComments(articleId)
{
    fetch("ajax/get_comments.php?article_id=" + articleId)
    .then(res => res.json())
    .then(data => {

        let html = "";

        data.forEach(c => {
            html += `
            <div class="card mb-2">
                <div class="card-body">
                    ${c.content}
                </div>
            </div>`;
        });

        document.getElementById("commentList").innerHTML = html;
    });
}