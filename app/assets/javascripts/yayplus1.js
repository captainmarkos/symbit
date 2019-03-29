var YayPlus1 = function() {

    var self = { /* object is private */
        //clicked_img: '../../assets/images/yayplus1_yellow_40x40.png',
        //unclicked_img: '../../assets/images/yayplus1_white_40x40.png'

        score_0_clicked_img: '/assets/emojis/emoji_0.png',
        score_1_clicked_img: '/assets/emojis/emoji_1.png',
        score_2_clicked_img: '/assets/emojis/emoji_2.png',
        score_3_clicked_img: '/assets/emojis/emoji_3.png',
        score_4_clicked_img: '/assets/emojis/emoji_4.png',

        score_0_unclicked_img: '/assets/emojis/emoji_0_gray.png',
        score_1_unclicked_img: '/assets/emojis/emoji_1_gray.png',
        score_2_unclicked_img: '/assets/emojis/emoji_2_gray.png',
        score_3_unclicked_img: '/assets/emojis/emoji_3_gray.png',
        score_4_unclicked_img: '/assets/emojis/emoji_4_gray.png',

        MAX_LEVELS: 10,
        IMG_ID_PREFIX: 'yayplus1_',
        IPGEOLOCATION_API_KEY: '814aed9d715347a395b121bb61fccbe5'
    };

    var ratings = {
        levels: 5,
        total_score: 0,
        clicked_images: [],
        unclicked_images: [],

        create: function(elem_name, levels = 5) {
            if(levels > self.MAX_LEVELS) { this.levels = self.MAX_LEVELS; }
            else { this.levels = levels; }

            var elem = document.getElementById(elem_name);
            for(var i=0; i < this.levels; i++) {
                /* setup clicked and unclicked images arrays */
                this.clicked_images[i] = self['score_' + i + '_clicked_img'];
                this.unclicked_images[i] = self['score_' + i + '_unclicked_img'];

                /* initialize rating, set to unclicked image */
                var img = document.createElement('img');
                img.setAttribute('id', self.IMG_ID_PREFIX + i);
                img.setAttribute('alt', 'yay+' + i);
                img.setAttribute('src', this.unclicked_images[i]);

                /* setup click handler for rating image */
                img.onclick = function() {
                    var id = this.getAttribute('id');
                    var score = parseInt(id.replace(self.IMG_ID_PREFIX, ''), 10) + 1;
                    ratings.on(score);
                    console.log('--> [click]: total_score: ', ratings.total_score);
                };

                /* add unclicked rating image to element */
                elem.appendChild(img);
            }
            this.total_score = 0;
        },

        action: function(clicked, idx) {
            var on = this.clicked_images[idx];
            var off = this.unclicked_images[idx];
            var attr_val = clicked ? on : off;
            var img = document.getElementById(self.IMG_ID_PREFIX + idx);
            img.setAttribute('src', attr_val);
        },

        reset: function() {
            for(var i=0; i < this.levels; i++) { this.action(false, i); }
            this.total_score = 0;
        },

        on: function(level) {
            this.reset();
            if(level > this.levels) { level = this.levels; }
            for(var i=0; i < level; i++) { this.action(true, i); }
            this.total_score = level;
        },

        /* TODO: wire in the below */
        get: function() {
            $.ajax({
              url: 'script.php',
              method: 'GET',
              data: this.total_score
            }).done(function(response) {
                this.total_score = response.total_score;
                return { score: this.total_score };
            }).fail(function(jqXHR, textStatus) {
                return {
                    success: false,
                    message: 'POST request failed: ' + textStatus
                };
            })
        },

        save: function() {
            var request = $.ajax({
                url: 'script.php',
                method: 'POST',
                data: this.total_score
            }).done(function(response) {
                return {
                    success: response.status,
                    message: response.message
                };
            }).fail(function(jqXHR, textStatus) {
                return {
                    success: false,
                    message: 'POST request failed: ' + textStatus
                };
            })
        },

        geolocate_user: function() {
            $.ajax({
              method: 'GET',
              url: 'https://api.ipgeolocation.io/ipgeo?apiKey=' + self.IPGEOLOCATION_API_KEY
            }).done(function(response) {
                console.log('--> user_ip: ', response);
            }).fail(function(jqXHR, textStatus) {
                console.log('--> user_ip failed: ', textStatus);
            })
        },

        remove_from_dom: function(elem_name) {
            /* remove only the children elements */
            var elem = document.getElementById(elem_name);
            if(!elem) { return false; }
            while(elem.firstChild) { elem.removeChild(elem.firstChild); }
            this.total_score = 0;
            return true;
        }

    }; /* end ratings definitions */

    return ratings;
};
