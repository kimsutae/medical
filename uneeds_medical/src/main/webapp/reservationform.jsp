<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Hospital</title>

<link rel="stylesheet" href="../../../resources/medical/reservation_test.css">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>


<script type="text/javascript">
$(function() {
	  if ($(this).hasClass('impossible') == false) {
	    $(".point").hide();
	    $(".calendar table td span").removeClass('active');
	    $(".calendar table td span .on").remove();
	    $(this).append($('<div class="on"></div>'));
	    $(this).addClass('active');
	  } else {}
	});


</script>

<script>
var calendar = {

		init: function(ajax) {

			if (ajax) {

	      $.ajax({
	  				url: '../../../resources/medical/data/events.json',
	  				type: 'GET',
	  			})
	  			.done(function(data) {
	          var events = data.events;

	          // loop json & append to dom
	          for (var i = 0; i < events.length; i++) {
	            $('.list').append('<div class="day-event" date-day="'+ events[i].day +'" date-month="' + events[i].month +'" date-year="'+ events[i].year +'" data-number="'+ i +'"><a href="#" class="close fontawesome-remove"></a><h2 class="title">'+ events[i].title +'</h2><p>'+ events[i].description +'</p><label class="check-btn"><input type="checkbox" class="save" id="save" name="" value=""/><span>Save to personal list!</span></label></div>');
	          }

	          // start calendar
	          calendar.startCalendar();

	  			})
	  			.fail(function(data) {
	  				console.log(data);
	  			});
			} else {

	      // if not using ajax start calendar
	      calendar.startCalendar();
	    }

		},

	  startCalendar: function() {
	    var mon = 'Mon';
			var tue = 'Tue';
			var wed = 'Wed';
			var thur = 'Thur';
			var fri = 'Fri';
			var sat = 'Sat';
			var sund = 'Sun';

			/**
			 * Get current date
			 */
			var d = new Date();
			var strDate = yearNumber + "/" + (d.getMonth() + 1) + "/" + d.getDate();
			var yearNumber = (new Date).getFullYear();
			/**
			 * Get current month and set as '.current-month' in title
			 */
			var monthNumber = d.getMonth() + 1;

			function GetMonthName(monthNumber) {
				var months = ['January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December'];
				return months[monthNumber - 1];
			}

			setMonth(monthNumber, mon, tue, wed, thur, fri, sat, sund);

			function setMonth(monthNumber, mon, tue, wed, thur, fri, sat, sund) {
				$('.month').text(GetMonthName(monthNumber) + ' ' + yearNumber);
				$('.month').attr('data-month', monthNumber);
				printDateNumber(monthNumber, mon, tue, wed, thur, fri, sat, sund);
			}

			$('.btn-next').on('click', function(e) {
				var monthNumber = $('.month').attr('data-month');
				if (monthNumber > 11) {
					$('.month').attr('data-month', '0');
					var monthNumber = $('.month').attr('data-month');
					yearNumber = yearNumber + 1;
					setMonth(parseInt(monthNumber) + 1, mon, tue, wed, thur, fri, sat, sund);
				} else {
					setMonth(parseInt(monthNumber) + 1, mon, tue, wed, thur, fri, sat, sund);
				};
			});

			$('.btn-prev').on('click', function(e) {
				var monthNumber = $('.month').attr('data-month');
				if (monthNumber < 2) {
					$('.month').attr('data-month', '13');
					var monthNumber = $('.month').attr('data-month');
					yearNumber = yearNumber - 1;
					setMonth(parseInt(monthNumber) - 1, mon, tue, wed, thur, fri, sat, sund);
				} else {
					setMonth(parseInt(monthNumber) - 1, mon, tue, wed, thur, fri, sat, sund);
				};
			});

			/**
			 * Get all dates for current month
			 */

			function printDateNumber(monthNumber, mon, tue, wed, thur, fri, sat, sund) {

				$($('tbody.event-calendar tr')).each(function(index) {
					$(this).empty();
				});

				$($('thead.event-days tr')).each(function(index) {
					$(this).empty();
				});

				function getDaysInMonth(month, year) {
					// Since no month has fewer than 28 days
					var date = new Date(year, month, 1);
					var days = [];
					while (date.getMonth() === month) {
						days.push(new Date(date));
						date.setDate(date.getDate() + 1);
					}
					return days;
				}

				i = 0;

				setDaysInOrder(mon, tue, wed, thur, fri, sat, sund);

				function setDaysInOrder(mon, tue, wed, thur, fri, sat, sund) {
					var monthDay = getDaysInMonth(monthNumber - 1, yearNumber)[0].toString().substring(0, 3);
					if (monthDay === 'Mon') {
						$('thead.event-days tr').append('<td>' + mon + '</td><td>' + tue + '</td><td>' + wed + '</td><td>' + thur + '</td><td>' + fri + '</td><td>' + sat + '</td><td>' + sund + '</td>');
					} else if (monthDay === 'Tue') {
						$('thead.event-days tr').append('<td>' + tue + '</td><td>' + wed + '</td><td>' + thur + '</td><td>' + fri + '</td><td>' + sat + '</td><td>' + sund + '</td><td>' + mon + '</td>');
					} else if (monthDay === 'Wed') {
						$('thead.event-days tr').append('<td>' + wed + '</td><td>' + thur + '</td><td>' + fri + '</td><td>' + sat + '</td><td>' + sund + '</td><td>' + mon + '</td><td>' + tue + '</td>');
					} else if (monthDay === 'Thu') {
						$('thead.event-days tr').append('<td>' + thur + '</td><td>' + fri + '</td><td>' + sat + '</td><td>' + sund + '</td><td>' + mon + '</td><td>' + tue + '</td><td>' + wed + '</td>');
					} else if (monthDay === 'Fri') {
						$('thead.event-days tr').append('<td>' + fri + '</td><td>' + sat + '</td><td>' + sund + '</td><td>' + mon + '</td><td>' + tue + '</td><td>' + wed + '</td><td>' + thur + '</td>');
					} else if (monthDay === 'Sat') {
						$('thead.event-days tr').append('<td>' + sat + '</td><td>' + sund + '</td><td>' + mon + '</td><td>' + tue + '</td><td>' + wed + '</td><td>' + thur + '</td><td>' + fri + '</td>');
					} else if (monthDay === 'Sun') {
						$('thead.event-days tr').append('<td>' + sund + '</td><td>' + mon + '</td><td>' + tue + '</td><td>' + wed + '</td><td>' + thur + '</td><td>' + fri + '</td><td>' + sat + '</td>');
					}
				};
				$(getDaysInMonth(monthNumber - 1, yearNumber)).each(function(index) {
					var index = index + 1;
					if (index < 8) {
						$('tbody.event-calendar tr.1').append('<td date-month="' + monthNumber + '" date-day="' + index + '" date-year="' + yearNumber + '">' + index + '</td>');
					} else if (index < 15) {
						$('tbody.event-calendar tr.2').append('<td date-month="' + monthNumber + '" date-day="' + index + '" date-year="' + yearNumber + '">' + index + '</td>');
					} else if (index < 22) {
						$('tbody.event-calendar tr.3').append('<td date-month="' + monthNumber + '" date-day="' + index + '" date-year="' + yearNumber + '">' + index + '</td>');
					} else if (index < 29) {
						$('tbody.event-calendar tr.4').append('<td date-month="' + monthNumber + '" date-day="' + index + '" date-year="' + yearNumber + '">' + index + '</td>');
					} else if (index < 32) {
						$('tbody.event-calendar tr.5').append('<td date-month="' + monthNumber + '" date-day="' + index + '" date-year="' + yearNumber + '">' + index + '</td>');
					}
					i++;
				});
				var date = new Date();
				var month = date.getMonth() + 1;
				var thisyear = new Date().getFullYear();
				setCurrentDay(month, thisyear);
				setEvent();
				displayEvent();
			}

			/*
			 * Get current day and set as '.current-day'
			 */
			function setCurrentDay(month, year) {
				var viewMonth = $('.month').attr('data-month');
				var eventYear = $('.event-days').attr('date-year');
				if (parseInt(year) === yearNumber) {
					if (parseInt(month) === parseInt(viewMonth)) {
						$('tbody.event-calendar td[date-day="' + d.getDate() + '"]').addClass('current-day');
					}
				}
			};

			/*
			 * Add class '.active' on calendar date
			 */
			$('tbody td').on('click', function(e) {
				if ($(this).hasClass('event')) {
					$('tbody.event-calendar td').removeClass('active');
					$(this).addClass('active');
				} else {
					$('tbody.event-calendar td').removeClass('active');
				};
			});

			/*
			 * Add '.event' class to all days that has an event
			 */
			function setEvent() {
				$('.day-event').each(function(i) {
					var eventMonth = $(this).attr('date-month');
					var eventDay = $(this).attr('date-day');
					var eventYear = $(this).attr('date-year');
					var eventClass = $(this).attr('event-class');
					if (eventClass === undefined) eventClass = 'event';
					else eventClass = 'event ' + eventClass;

					if (parseInt(eventYear) === yearNumber) {
						$('tbody.event-calendar tr td[date-month="' + eventMonth + '"][date-day="' + eventDay + '"]').addClass(eventClass);
					}
				});
			};

			/**
			 * Get current day on click in calendar
			 * and find day-event to display
			 */
			function displayEvent() {
				$('tbody.event-calendar td').on('click', function(e) {
					$('.day-event').slideUp('fast');
					var monthEvent = $(this).attr('date-month');
					var dayEvent = $(this).text();
					$('.day-event[date-month="' + monthEvent + '"][date-day="' + dayEvent + '"]').slideDown('fast');
				});
			};

	  },

	};

	$(document).ready(function() {
		calendar.init('ajax');
	});



</script>
  
  
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<body>

		<section id="contents" class="consult consult_bg01">

			<h2>온라인 예약</h2>

			<div class="step03">
				<form name="f1" method="post" action="">
					<input name="Rday" value="2018-07-20" type="hidden">
					<input name="rchk" value="" type="hidden">
					<input name="renz" value="미사용" type="hidden">
					<input name="renzday1" value="선택" type="hidden">
					<input name="renzday2" value="선택" type="hidden">
					<input name="moyn1" value="" type="hidden">
					<input name="reserve_Num" value="" type="hidden"> 
					
					<fieldset>
					<legend>예약날짜 선택</legend>
					<div class="con_left">
						<dl class="calendar">
							<dt><h3>1. 날짜선택</h3></dt>
							<dd id="pg_calendar">
<div class="ti" colspan="7">
	<a href="#" class="btn_prev">201806</a>
	2018년 07월
    <a href="#" class="btn_next">201808</a>
</div>

<div class="con">
	<table summary="날짜선택">
		<caption>날짜선택</caption>
		<colgroup>
				<col width="14%">
				<col width="14%">
				<col width="14%">
				<col width="14%">
				<col width="14%">
				<col width="14%">
				<col width="14%">
		</colgroup>
		<tbody>
			<tr>
				<th><span class="first">일</span></th>
				<th><span>월</span></th>
				<th><span>화</span></th>
				<th><span>수</span></th>
				<th><span>목</span></th>
				<th><span>금</span></th>
				<th><span class="last">토</span></th>
			</tr>
	<tr>
<td><span class="impossible first" style="border-top: medium none;">1</span></td>
<td><span class="impossible" style="border-top: medium none;">2</span></td>
<td><span class="impossible" style="border-top: medium none;">3</span></td>
<td><span class="impossible" style="border-top: medium none;">4</span></td>
<td><span class="impossible" style="border-top: medium none;">5</span></td>
<td><span class="impossible" style="border-top: medium none;">6</span></td>
<td><span class="impossible last" style="border-top: medium none;">7</span></td>
</tr>
<tr>
<td><span class="impossible first">8</span></td>
<td><span class="impossible">9</span></td>
<td><span class="impossible">10</span></td>
<td><span class="impossible">11</span></td>
<td><span class="impossible">12</span></td>
<td><span class="impossible">13</span></td>
<td><span class="impossible last">14</span></td>
</tr>
<tr>
<td><span class="impossible first">15</span></td>
<td><span class="impossible">16</span></td>
<td><span class="impossible">17</span></td>
<td><span class="impossible">18</span></td>
<td onclick="javascript:fnSetDay('2018-07-19');" id="2018-07-19"><span>19</span></td>
<td onclick="javascript:fnSetDay('2018-07-20');" id="2018-07-20"><span class="active">20<div class="on"></div></span></td>
<td onclick="javascript:fnSetDay('2018-07-21');" id="2018-07-21"><span class="last">21</span></td>
</tr>
<tr>
<td><span class="impossible first">22</span></td>
<td onclick="javascript:fnSetDay('2018-07-23');" id="2018-07-23"><span>23</span></td>
<td onclick="javascript:fnSetDay('2018-07-24');" id="2018-07-24"><span>24</span></td>
<td onclick="javascript:fnSetDay('2018-07-25');" id="2018-07-25"><span>25</span></td>
<td onclick="javascript:fnSetDay('2018-07-26');" id="2018-07-26"><span>26</span></td>
<td><span class="impossible">27</span></td>
<td onclick="javascript:fnSetDay('2018-07-28');" id="2018-07-28"><span class="last">28</span></td>
</tr>
<tr>
<td><span class="impossible first">29</span></td>
<td onclick="javascript:fnSetDay('2018-07-30');" id="2018-07-30"><span>30</span></td>
<td onclick="javascript:fnSetDay('2018-07-31');" id="2018-07-31"><span>31</span></td>
<td><span class="next">&nbsp;</span></td>
<td><span class="next">&nbsp;</span></td>
<td><span class="next">&nbsp;</span></td>
<td><span class="next last">&nbsp;</span></td>
</tr>
</tbody>
</table>
</div>


</dd>
						<dd class="txt" id="txt01">
							예약을 원하는 날짜를 선택 하시면<br>예약 가능한 시간을 확인하실 수 있습니다.
						</dd>
							
	</dl>
						
						<dl class="memo">
							<dt><h3>3. 메모하기</h3></dt>
							<dd>
								<textarea name="memo" id="memo" maxlength="60" onkeyup="return textLimit(this);"></textarea>
							</dd>
						</dl>
					</div>
					
					<dl class="time">
						<dt><h3>2. 시간선택</h3></dt>
						<dd class="point" style="display: none;"><div class="bg"></div><p><img src="../../../resources/medical/img/ico_point.gif" alt=""><br>먼저 날짜를<br>선택해 주세요</p></dd>
						<dd class="division"><span class="yes">예약가능</span><span class="no">예약불가</span></dd>

					<dd id="pg_time_table" class="minute">
							<table summary="시간 선택" class="am">
								<caption>시간 선택</caption>
								<colgroup>
									<col width="43">
									<col width="38">
									<col width="*">
								</colgroup>
								<tbody>
								
							    
									<tr>
										<th rowspan="3" class="ti">오전</th>								
										<th class="hour am">10시</th>
										<td>
											<ul class="time10">
												 
														<li><span class="un"><!--time X-->00</span></li>	
														<li><span class="un"><!--time X-->10</span></li>
														<li><span class="un"><!--time X-->20</span></li>
														<li><span class="un"><!--time X-->30</span></li>
														<li><span class="un"><!--time X-->40</span></li>
														<li><span class="un"><!--time X-->50</span></li>
														
													
											</ul>
										</td>
									</tr>
									<tr>
										<th class="hour am">11시</th>
										<td>
											<ul class="time10">
												 
														<li><span class="un"><!--time X-->00</span></li>
														<li><span class="un"><!--time X-->10</span></li>
														<li><span class="un"><!--time X-->20</span></li>
														<li><span class="un"><!--time X-->30</span></li>
														<li><span class="un"><!--time X-->40</span></li>
														<li><span class="un"><!--time X-->50</span></li>
											</ul>
										</td>
									</tr>
									<tr>
										<th class="hour am">12시</th>
										<td>
											<ul class="time10">
														<li><span class="un"><!--time X-->00</span></li>
														<li><span class="un"><!--time X-->10</span></li>
														<li><span class="un"><!--time X-->20</span></li>
														<li><span class="un"><!--time X-->30</span></li>
														<li><span class="un"><!--time X-->40</span></li>
														<li><span class="un"><!--time X-->50</span></li>
											</ul>
										</td>
									</tr>

								

								</tbody>
							</table>
							<table summary="시간 선택" class="pm">
								<caption>시간 선택</caption>
								<colgroup>
									<col width="43">
									<col width="38">
									<col width="*">
								</colgroup>
								<tbody>
									<tr>
										<th rowspan="8" class="ti">오후</th>
										<th class="hour pm">1시</th>
											<td>
											<ul class="time10">
												 
														<li><span class="un"><!--time X-->00</span></li>
														<li><span class="un"><!--time X-->10</span></li>
														<li><span class="un"><!--time X-->20</span></li>
														<li><span class="un">30</span></li>
														<li><span class="un">40</span></li>
														<li><span class="un">50</span></li>
											</ul>
										</td>
									</tr>
									<tr>
										<th class="hour pm">2시</th>
										<td>
											<ul class="time10">
														<li><span class="un">00</span></li>
														<li><span class="un">10</span></li>
														<li><span class="un">20</span></li>
														<li><span class="un">30</span></li>
														<li><span class="un">40</span></li>
														<li><span class="un">50</span></li>													
											</ul>
										</td>
									</tr>
									<tr>
										<th class="hour pm">3시</th>
											<td>
											<ul class="time10">
														<li><span class="un">00</span></li>
														<li><span class="un">10</span></li>
														<li><span class="un">20</span></li>
														<li><span class="un">30</span></li>
														<li><span class="un">40</span></li>
														<li><span class="un">50</span></li>
											</ul>
										</td>
									</tr>
									<tr>
										<th class="hour pm">4시</th>
											<td>
											<ul class="time10">
														<li><span class="un"><!--time X-->00</span></li>
														<li><span class="un"><!--time X-->10</span></li>
														<li><span class="un"><!--time X-->20</span></li>
														<li><span class="un"><!--time X-->30</span></li>
														<li><span class="un"><!--time X-->40</span></li>
														<li><span class="un"><!--time X-->50</span></li>
											</ul>
										</td>
									</tr>
									<tr>
										<th class="hour pm">5시</th>
											<td>
											<ul class="time10">
												 
														<li><span class="un"><!--time X-->00</span></li>
														<li><span class="un"><!--time X-->10</span></li>
														<li><span class="un"><!--time X-->20</span></li>
														<li><span class="un">30</span></li>
														<li><span class="un">40</span></li>
														<li><span class="un">50</span></li>
														
													
											</ul>
										</td>
									</tr>
									<tr>
										<th class="hour pm">6시</th>
											<td>
											<ul class="time10">
												 
													
														<li><span class="un">00</span></li>
														<li><span class="un">10</span></li>
														<li><span class="un">20</span></li>
														<li><span class="un">30</span></li>
														<li><span class="un">40</span></li>
														<li><span class="un">50</span></li>
														
													
											</ul>
										</td>
									</tr>
									<tr>
										<th class="hour pm">7시</th>
											<td>
											<ul class="time10">
												 
														<li><span class="un"><!--time X-->00</span></li>
														<li><span class="un"><!--time X-->10</span></li>
														<li><span class="un"><!--time X-->20</span></li>
														<li><span class="un"><!--time X-->30</span></li>
														<li><span class="un"><!--time X-->40</span></li>
														<li><span class="un"><!--time X-->50</span></li>
														
													
											</ul>
										</td>
									</tr>
									<tr>
										<th class="hour pm">8시</th>
											<td>
											<ul class="time10">
												 
														<li><span class="un"><!--time X-->00</span></li>
														<li><span class="un"><!--time X-->10</span></li>
														<li><span class="un"><!--time X-->20</span></li>
														<li><span class="un"><!--time X-->30</span></li>
														<li><span class="un"><!--time X-->40</span></li>
														<li><span class="un"><!--time X-->50</span></li>
											</ul>
										</td>
									</tr>
								</tbody>
							</table>
						
					</dl>
					<div class="description">
						<strong>예약 시 주의사항</strong>
						<p>
							당일예약 혹은 이미 예약 완료된 시간에 꼭 예약을 원하시는 분은 고객지원실로 문의해주시기 바랍니다.<br>
							(02-501-6800)
						</p>
						<p>
							온라인예약은 당일로부터 30일 이내에만 가능합니다.<br>
							(한달 뒤 예약은 전화상담으로 부탁 드립니다.)
						</p>
					</div>
					
					</fieldset>
				</form>
			</div>
			
		</section>

<!-- } 콘텐츠 끝 -->

</body>
</html>
