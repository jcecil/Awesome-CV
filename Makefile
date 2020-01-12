.PHONY: examples

SZUNRAY_OUT = szunray
SZUNRAY_DIR = szunray/resume
SZUNRAY_SRCS = $(shell find $(SZUNRAY_DIR) -name '*.tex')

CC = xelatex
EXAMPLES_DIR = examples
RESUME_DIR = examples/resume
CV_DIR = examples/cv
RESUME_SRCS = $(shell find $(RESUME_DIR) -name '*.tex')
CV_SRCS = $(shell find $(CV_DIR) -name '*.tex')

examples: $(foreach x, coverletter cv resume, $x.pdf)

resume.pdf: $(EXAMPLES_DIR)/resume.tex $(RESUME_SRCS)
	$(CC) -output-directory=$(EXAMPLES_DIR) $<

cv.pdf: $(EXAMPLES_DIR)/cv.tex $(CV_SRCS)
	$(CC) -output-directory=$(EXAMPLES_DIR) $<

coverletter.pdf: $(EXAMPLES_DIR)/coverletter.tex
	$(CC) -output-directory=$(EXAMPLES_DIR) $<

szunray.pdf: $(SZUNRAY_OUT)/resume.tex $(SZUNRAY_SRCS)
	$(CC) -output-directory=$(SZUNRAY_OUT) $<

clean:
	rm -rf $(EXAMPLES_DIR)/*.pdf
