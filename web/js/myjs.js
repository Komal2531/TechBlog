function doLike(postid, userid) {
    console.log(postid, userid);

    const data = {
        userid: userid,
        postid: postid
    };

    $.ajax({
        url: "LikeServlet",
        data: data,
        success: function (data, textStatus, jqXHR) {
            if (data.trim() === 'Liked') {
                let c = $('.likeCountSpan' + postid).html();
                c++;
                $('.likeCountSpan' + postid).html(c);
                $('.likeButton' + postid).removeClass('btn-outline-primary');
                $('.likeButton' + postid).addClass('btn-primary');
            }
            if (data.trim() === 'Disliked') {
                let c = $('.likeCountSpan' + postid).html();
                c--;
                $('.likeCountSpan' + postid).html(c);
                $('.likeButton' + postid).removeClass('btn-primary');
                $('.likeButton' + postid).addClass('btn-outline-primary');
            }
        },
        error: function (jqXHR, textStatus, errorThrown) {
            console.log(errorThrown);
        }
    });
}
