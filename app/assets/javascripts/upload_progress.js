
if ( !window.console ) window.console = {};
if ( !console.log || 'function' != typeof console.log ) console.log = function(){};

Element.extend({
	'startBorderLoader': function(ms) {
		this.bl_counter = 0;
		this.bl_ms = ms;
		this.bl_timer = setInterval((function(el){ return function(){ el.borderLoad(); }; })(this), ms);
		return this;
	},
	'stopBorderLoader': function() {
		clearInterval(this.bl_timer || 0);
		return this.css('border-style', '');
	},
	'borderLoad': function() {
		var borders = ['dotted', 'dashed'];
		var border = borders[ (this.bl_counter++) % borders.length ];
		this.css('border-style', border);
		return this;
	}
});

function queue(file) {
	if (!file) return queue.files.shift();
	queue.files.push(file);
	queue.uploads[file.unid] = [file.size, 0]; // [total, done]
	return queue.count();
}
queue.files = [];
queue.count = function() {
	return queue.files.length;
};
queue.totalSize = function() {
	var t = 0
	for ( var i=0; i<queue.count(); i++ ) {
		t += queue.files[i].size; // .size ?
	}
	return t;
};
queue.uploads = {};
queue.progress = function() {
	var total = 0, done = 0, x;
	for ( x in queue.uploads ) {
		total += queue.uploads[x][0];
		done += queue.uploads[x][1];
	}
	return [total, done];
};
queue.progress.visualize = function() {
	var p = queue.progress(), pct = p[1] / p[0];
console.log('[progress][ ' + p[1] + ' / ' + p[0] + ' ]');
	$('upb').max = 1000;
	$('upb').value = pct * 1000;
};
queue.progress.visualize.file = function(total, done) {
	var pct = done / total;
	$('fupb').max = 1000;
	$('fupb').value = pct * 1000;
};

function showImage_1( file ) {
	var title = file.name;
	var img = new Element('div', {
		'id': 'img_' + parseInt(Math.random()*999999999999),
		'title': title
	}).addClass(
		'img'
	).addEvent('dblclick', function(e) {
		if ( $(this).hasClass('success') && $(this).attr('imgurl') ) {
			var url = $(this).attr('imgurl');
		}
		else {
			var url = $(this).css('background-image').replace(/^url\('?/, '').replace(/'?\)$/, '');
		}
		window.open(url);
	}).injectTop(
		$('dropper')
	);

	if ( window.webkitURL && window.webkitURL.createObjectURL ) {
		// Chrome 12 and maybe new Safari's?
		img.css('background-image', "url(" + window.webkitURL.createObjectURL(file) + ")");
	}
	else if ( window.URL && window.URL.createObjectURL ) {
		// Firefox 4 (and Chrome 11 I think)
		img.css('background-image', "url(" + window.URL.createObjectURL(file) + ")");
	}
	else {
		// You suck!
		var fr = new FileReader();
		fr.onload = function(e) {
			img.css('background-image', "url(" + this.result + ")");
		}
		fr.readAsDataURL(file);
	}
	return img.id;
}
function showImage_2( file ) {
	var title = file.name;
	var p = new Element('p', {
		'id': 'img_' + parseInt(Math.random()*999999999999),
		'title': title
	}).addClass(
		'file'
	).update(
		title + ' (' + Math.round(file.size/1024) + ' KB)'
	).injectTop(
		$('file-list')
	);
	return p.id;
}
var showImage = /*0.5 < Math.random() ? showImage_2 :*/ showImage_1;

function uploadComplete() {
	alert('done');
}

function imageUploaded(file, t) {
//	$('upb').value++;
	try {
		var rsp = JSON.parse(t)
console.log('upload response:', rsp)
	}
	catch ( ex ) {
		alert('Invalid repsonse: ' + t)
		return
	}
	var obj = $(file.unid).stopBorderLoader()

	if ( rsp.error ) {
		obj.addClass('failure');
	}
	else {
		obj.attr('imgurl', rsp.filepath).addClass('success');
	}
	if ( $('queue').checked ) {
		uploadFile(queue());
	}
}

function uploadFile(file) {
	if (!file) return uploadComplete();

	$(file.unid).startBorderLoader(400)

	var url = '../image.php', data

	// new way: with FormData
	if ( true ) {
		data = new FormData
		data.append('file', file)
	}
	// 'old' way
	else {
		data = file
		url += '?upload=1&filename=' + file.name
	}

console.log('Start upload: ' + url)

/*	// upload 2
	new Ajax(url, {
		file: file,
		data: data,
		onComplete: function(t) {
console.log(['Upload complete', t]);
			imageUploaded(this.options.file, t);
		}
	}).request();*/

	// upload 1
	var xhr = new XMLHttpRequest();
	xhr.file = file;
// console.log(['xhr.upload', xhr.upload]);
// console.log(['xhr.onprogress', xhr.onprogress]);
	xhr.addEventListener('progress', function(e) {
		var done = e.position || e.loaded, total = e.totalSize || e.total;
		queue.progress.visualize.file(total, done);
		queue.uploads[file.unid][1] = done;
		queue.progress.visualize();
		console.log('xhr progress: ' + (Math.floor(done/total*1000)/10) + '%');
	}, false);
	if ( xhr.upload ) {
		xhr.upload.onprogress = function(e) {
			var done = e.position || e.loaded, total = e.totalSize || e.total;
			queue.progress.visualize.file(total, done);
			queue.uploads[file.unid][1] = done;
			queue.progress.visualize();
			console.log('xhr.upload progress: ' + done + ' / ' + total + ' = ' + (Math.floor(done/total*1000)/10) + '%');
		};
	}
	xhr.onreadystatechange = function(e) {
//console.log(['XHR onreadystatechange', e]);
		if ( 4 == this.readyState ) {
			queue.progress.visualize.file(1, 1);
			queue.uploads[file.unid][1] = queue.uploads[file.unid][0];
			queue.progress.visualize();
console.log(['xhr upload complete', e]);
			var t = this.responseText;
//console.log(['Upload complete', t]);
			imageUploaded(this.file, t);
		}
	};
	xhr.open('post', url, true);
	xhr.send(data);
}

function dropHandler(e) {
console.log(['dropHandler', e]);
	e = new Event(e).stop();
//	$('loading').show();
	$(this).removeClass('over');
	var dt = e.event.dataTransfer, files = dt.files;
	return handleFiles(files);
}

function handleFiles(files) {
	for ( var i=0; i<files.length; i++ ) {
		var file = files[i];
		if ( ['image/jpeg', 'image/bmp', 'image/gif', 'image/png'].contains(file.type) ) {

//			(function(file) {

				// make 'thumbnail'
				file.unid = showImage(file);

				if ( $('upload').checked ) {
					if ( $('queue').checked ) {
						queue(file);
					}
					else {
						
					}
				}

//			})(_file);

		}
	}
console.log('queue size = ' + queue.count() + ' (' + queue.progress().join(' / ') + ')');
	if ( 0 < queue.count() ) {
		// start upload
//		$('upb').value = 0;
//		$('upb').max = queue.count();
		uploadFile(queue());
	}
	return false;
}

function dragOverHandler(e) {
	e = new Event(e).stop();
	$(this).addClass('over');
	return false;
}

function dragLeaveHandler(e) {
	e = new Event(e).stop();
	$(this).removeClass('over');
	return false;
}

function filesChosenHandler(e) {
	if ( this.form.ajax.checked ) {
		handleFiles(this.files);
	}
	else {
		this.form.submit();
	}
}

$(function() {
	$('dropper').addEvents({
		'drop': dropHandler,
		'dragover': dragOverHandler,
		'dragleave': dragLeaveHandler
	});
	$$('.files').addEvents({
		'change': filesChosenHandler,
		'dragover': function() {
			this.addClass('over')
		},
		'dragleave': function() {
			this.removeClass('over')
		}
	});
});