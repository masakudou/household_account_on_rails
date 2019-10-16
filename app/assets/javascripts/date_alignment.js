/* date_alignment.js                                 */

const thirty_one_days = ["1", "3", "5", "7", "8", "10", "12"];
const thirty_days     = ["4", "6", "9", "11"];

/* 収支登録フォーム内のdate_selectにおいて月選択時に選択可能な日付の整合性を取る */
function dateAlignmentForBookRecordForm()
{
  const selected_month = document.getElementById("book_record_record_date_2i").value;
  if (thirty_one_days.indexOf(selected_month) >= 0)
  {
    alert(selected_month + "月は31日までです。");
  }
  else if (thirty_days.indexOf(selected_month) >= 0)
  {
    alert(selected_month + "月は30日までです。");
  }
  else
  {
    alert(selected_month + "は難しいね。");
  }
}

/* 収支登録フォームの登録月を変更する度に整合性を取る。 */
$(document).on("change", "select[id$='_2i']",function(){ dateAlignmentForBookRecordForm(); });
