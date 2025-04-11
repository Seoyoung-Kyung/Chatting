alter table professor drop column prof_photo;
alter table professor add prof_photo varchar(50);

alter table student drop column s_photo;
alter table student add s_photo varchar(50);

UPDATE professor SET prof_photo = 'p_img/5001_황인엽.jpg' WHERE prof_id = '5001';
UPDATE professor SET prof_photo = 'p_img/5002_박서준.png' WHERE prof_id = '5002';
UPDATE professor SET prof_photo = 'p_img/5003_조인성.jpg' WHERE prof_id = '5003';
UPDATE professor SET prof_photo = 'p_img/5004_문가영.jpg' WHERE prof_id = '5004';
UPDATE professor SET prof_photo = 'p_img/5005_이지아.jpg' WHERE prof_id = '5005';
UPDATE professor SET prof_photo = 'p_img/5006_손예진.jpg' WHERE prof_id = '5006';

UPDATE student SET s_photo = 's_img/2018500025_박채원.jpg' WHERE s_id='2018500025';
UPDATE student SET s_photo = 's_img/2018500030_이무진.jpg' WHERE s_id='2018500030';
UPDATE student SET s_photo = 's_img/2020500021_손혜주.jpg' WHERE s_id='2020500021';
UPDATE student SET s_photo = 's_img/2020500022_김지우.jpg' WHERE s_id='2020500022';
UPDATE student SET s_photo = 's_img/2020500023_전희진.jpg' WHERE s_id='2020500023';
UPDATE student SET s_photo = 's_img/2020500024_조하슬.jpg' WHERE s_id='2020500024';
UPDATE student SET s_photo = 's_img/2020500026_최예림.jpg' WHERE s_id='2020500026';
UPDATE student SET s_photo = 's_img/2020500027_김정은.jpg' WHERE s_id='2020500027';
UPDATE student SET s_photo = 's_img/2020500028_정진솔.jpg' WHERE s_id='2020500028';
UPDATE student SET s_photo = 's_img/2020500029_임여진.jpg' WHERE s_id='2020500029';
UPDATE student SET s_photo = 's_img/2020500031_유지애.jpg' WHERE s_id='2020500031';
UPDATE student SET s_photo = 's_img/2020500032_서지수.jpg' WHERE s_id='2020500032';
UPDATE student SET s_photo = 's_img/2020500033_류수정.jpg' WHERE s_id='2020500033';
UPDATE student SET s_photo = 's_img/2020500034_정예인.jpg' WHERE s_id='2020500034';
UPDATE student SET s_photo = 's_img/2020500035_박명은.jpg' WHERE s_id='2020500035';
UPDATE student SET s_photo = 's_img/2020500036_김선우.jpg' WHERE s_id='2020500036';
UPDATE student SET s_photo = 's_img/2020500038_지창민.jpg' WHERE s_id='2020500038';
UPDATE student SET s_photo = 's_img/2020500037_이재현.jpg' WHERE s_id='2020500037';
UPDATE student SET s_photo = 's_img/2020500039_이주연.jpg' WHERE s_id='2020500039';
UPDATE student SET s_photo = 's_img/2020500040_이미주.jpg' WHERE s_id='2020500040';
UPDATE student SET s_photo = 's_img/2021500001_유지민.jpg' WHERE s_id='2021500001';
UPDATE student SET s_photo = 's_img/2021500002_김민정.jpg' WHERE s_id='2021500002';
UPDATE student SET s_photo = 's_img/2021500003_김애리.jpg' WHERE s_id='2021500003';
UPDATE student SET s_photo = 's_img/2021500004_하성운.jpg' WHERE s_id='2021500004';
UPDATE student SET s_photo = 's_img/2021500005_이지은.jpg' WHERE s_id='2021500005';
UPDATE student SET s_photo = 's_img/2021500006_박성진.jpg' WHERE s_id='2021500006';
UPDATE student SET s_photo = 's_img/2021500007_박제형.jpg' WHERE s_id='2021500007';
UPDATE student SET s_photo = 's_img/2021500008_강영현.jpg' WHERE s_id='2021500008';
UPDATE student SET s_photo = 's_img/2021500009_윤도운.jpg' WHERE s_id='2021500009';
UPDATE student SET s_photo = 's_img/2021500010_김원필.jpg' WHERE s_id='2021500010';
UPDATE student SET s_photo = 's_img/2021500011_박시은.jpg' WHERE s_id='2021500011';
UPDATE student SET s_photo = 's_img/2021500012_이채영.jpg' WHERE s_id='2021500012';
UPDATE student SET s_photo = 's_img/2021500013_배수민.jpg' WHERE s_id='2021500013';
UPDATE student SET s_photo = 's_img/2021500015_심자윤.jpeg' WHERE s_id='2021500015';
UPDATE student SET s_photo = 's_img/2021500014_장예은.jpg' WHERE s_id='2021500014';
UPDATE student SET s_photo = 's_img/2021500016_윤세은.jpg' WHERE s_id='2021500016';
UPDATE student SET s_photo = 's_img/2021500017_임재범.jpg' WHERE s_id='2021500017';
UPDATE student SET s_photo = 's_img/2021500016_윤세은.jpg' WHERE s_id='2021500016';
UPDATE student SET s_photo = 's_img/2021500018_박진영.JPG' WHERE s_id='2021500018';
UPDATE student SET s_photo = 's_img/2021500019_최영재.jpg' WHERE s_id='2021500019';
UPDATE student SET s_photo = 's_img/2021500020_김유겸.jpg' WHERE s_id='2021500020';


