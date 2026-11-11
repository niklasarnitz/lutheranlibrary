\version "2.24.3"
% Lochner, Das Nicänische Bekenntniß. Printed page 181.
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
      \new Voice = "soprano" { \voiceOne fis'4 fis'4 gis'2 \bar "|" a'1 \bar "|" e'2 fis'4 fis'4 \bar "|" g'2 a'2 \bar "|" b'2 b'2 \bar "|" a'2 a'2 \bar "|" fis'2( e'2) \bar "|" d'1\fermata \bar "|" }
      \new Voice = "alto" { \voiceTwo d'4 d'4 e'2 e'1 cis'2 d'4 d'4 e'2 fis'2 g'2 g'2 fis'2 e'2 d'2.( cis'4) a1 }
    >>
    \new Lyrics \lyricsto "soprano" { \set ignoreMelismata = ##t macht le -- ben -- "dig," der von dem Va -- ter und dem Soh -- ne aus \skip 1 "geht," }
    \new Staff <<
      \clef bass \omit Staff.TimeSignature \global \cadenzaOn
      \new Voice { \voiceOne a4 b4 b2 cis'1 a2 a4 b4 b2 d'2 d'2 d'2 d'2 a2 a1 fis1 }
      \new Voice = "bass" { \voiceTwo d4 b,4 e2 a,1 a,2 d4 b,4 e2 d2 g2 g2 d2 cis2 d2( a,2) d1\fermata }
    >>
  >>
  \layout {
    ragged-right = ##f
    \context { \Score \autoBeamOff \remove "Bar_number_engraver" }
    \context { \Lyrics \override LyricText.font-size = #-2 }
  }
}
