
DESTDIR = .

root_dir    = .
source_dir  = $(root_dir)/src
audio_dir   = $(root_dir)/audio
build_dir   = $(DESTDIR)/$(root_dir)/build
install_dir = $(DESTDIR)/$(root_dir)/melody-skin

followpoint_source = $(source_dir)/followpoints.svg
followpoint_sd = 128
followpoint_hd = 256

.PHONEY: build clean install
build: buildfollowpoints

install:
	mkdir -pv $(install_dir)
	cp $(build_dir)/*.png $(install_dir)/
	cp $(audio_dir)/*.wav $(install_dir)/
	cp $(config_dir)/skin.ini $(install_dir)/
	cp $(config_dir)/MainHUDComponents.json $(install_dir)/

uninstall:
	rm -rf $(install_dir)

clean:
	rm -rf $(build_dir)


buildfollowpoints: $(followpoint_source)
	mkdir -pv $(build_dir)
	sed 's/xlink:href="#[0-5]_[a-zA-Z]\+"/xlink:href="#0_red"/'      $< > $(build_dir)/followpoint-0.svg
	sed 's/xlink:href="#[0-5]_[a-zA-Z]\+"/xlink:href="#1_yellow"/'   $< > $(build_dir)/followpoint-1.svg
	sed 's/xlink:href="#[0-5]_[a-zA-Z]\+"/xlink:href="#2_turquise"/' $< > $(build_dir)/followpoint-2.svg
	sed 's/xlink:href="#[0-5]_[a-zA-Z]\+"/xlink:href="#3_cyan"/'     $< > $(build_dir)/followpoint-3.svg
	sed 's/xlink:href="#[0-5]_[a-zA-Z]\+"/xlink:href="#4_seablue"/'  $< > $(build_dir)/followpoint-4.svg
	sed 's/xlink:href="#[0-5]_[a-zA-Z]\+"/xlink:href="#5_indigo"/'   $< > $(build_dir)/followpoint-5.svg
    
	svgexport $(build_dir)/followpoint-0.svg $(build_dir)/followpoint-0.png    pad $(followpoint_sd):$(followpoint_sd)
	svgexport $(build_dir)/followpoint-0.svg $(build_dir)/followpoint-0@2x.png pad $(followpoint_hd):$(followpoint_hd)

	svgexport $(build_dir)/followpoint-1.svg $(build_dir)/followpoint-1.png    pad $(followpoint_sd):$(followpoint_sd)
	svgexport $(build_dir)/followpoint-1.svg $(build_dir)/followpoint-1@2x.png pad $(followpoint_hd):$(followpoint_hd)

	svgexport $(build_dir)/followpoint-2.svg $(build_dir)/followpoint-2.png    pad $(followpoint_sd):$(followpoint_sd)
	svgexport $(build_dir)/followpoint-2.svg $(build_dir)/followpoint-2@2x.png pad $(followpoint_hd):$(followpoint_hd)

	svgexport $(build_dir)/followpoint-3.svg $(build_dir)/followpoint-3.png    pad $(followpoint_sd):$(followpoint_sd)
	svgexport $(build_dir)/followpoint-3.svg $(build_dir)/followpoint-3@2x.png pad $(followpoint_hd):$(followpoint_hd)

	svgexport $(build_dir)/followpoint-4.svg $(build_dir)/followpoint-4.png    pad $(followpoint_sd):$(followpoint_sd)
	svgexport $(build_dir)/followpoint-4.svg $(build_dir)/followpoint-4@2x.png pad $(followpoint_hd):$(followpoint_hd)

	svgexport $(build_dir)/followpoint-5.svg $(build_dir)/followpoint-5.png    pad $(followpoint_sd):$(followpoint_sd)
	svgexport $(build_dir)/followpoint-5.svg $(build_dir)/followpoint-5@2x.png pad $(followpoint_hd):$(followpoint_hd)



