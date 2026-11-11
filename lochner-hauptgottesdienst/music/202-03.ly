\version "2.24.3"
% Lochner, Der apostolische Glaube. Source pages 173–174.
#(set-global-staff-size 16)
\header { tagline = ##f }
\paper {
  paper-width = 120\mm
  left-margin = 3\mm right-margin = 1\mm
  top-margin = 0\mm bottom-margin = 0\mm
  indent = 0\mm print-page-number = ##f
  page-breaking = #ly:one-page-breaking
}
global = { \key d \major \time 2/2 \accidentalStyle forget }

\score {
  \new PianoStaff <<
    \new Staff <<
      \clef treble \omit Staff.TimeSignature \global \cadenzaOn
      \new Voice = "soprano" { \voiceOne d''2( cis''2) \bar "|" d''2 a'4 a'4 \bar "|" fis'2( e'2) \bar "|" d'1 \bar "|" fis'2 g'2 \bar "|" fis'2 e'2 \bar "|" fis'4 fis'4 d'4 d'4 \bar "|" }
      \new Voice = "alto" { \voiceTwo fis'2( e'2) fis'2 fis'4 e'4 d'2( cis'2) a1 d'2 d'2 d'2 cis'2 d'4 d'4 b4 a4 }
    >>
    \new Lyrics \lyricsto "soprano" { \set ignoreMelismata = ##t All \skip 1 mäch -- ti -- gen Va \skip 1 "ter," Schö -- pfer Him -- mels und der Er -- "den," }
    \new Staff <<
      \clef bass \omit Staff.TimeSignature \global \cadenzaOn
      \new Voice { \voiceOne a1 a2 d'4 a4 a1 fis1 a2 b2 a2 a2 a4 a4 g4 fis4 }
      \new Voice = "bass" { \voiceTwo d2( a,2) d2 d4 cis4 d2( a,2) d1 d2 g2 d2 a,2 d4 d4 g,4 d4 }
    >>
  >>
  \layout {
    ragged-right = ##f
    \context { \Score \autoBeamOff \remove "Bar_number_engraver" }
    \context { \Lyrics \override LyricText.font-size = #-2 }
  }
}
