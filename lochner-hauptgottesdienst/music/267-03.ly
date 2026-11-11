\version "2.24.3"
% Lochner, Luthers Weise. PDF scan 267, printed p. 242.
#(set-global-staff-size 15)
\header { tagline = ##f }
\paper {
  paper-width = 150\mm left-margin = 3\mm right-margin = 1\mm
  top-margin = 0\mm bottom-margin = 0\mm indent = 0\mm
  print-page-number = ##f page-breaking = #ly:one-page-breaking
}
global = { \key c \major \accidentalStyle forget \omit Staff.TimeSignature \cadenzaOn }
\score {
  \new StaffGroup <<
    \new Staff <<
      \clef treble \global
      \new Voice = "melody" { a'1 a'1 a'1 a'1 bes'1 a'1 g'1 f'\breve e'1 d'\breve \bar "|" a'1 a'1 a'1 a'1 gis'\breve a'1 b'1 }
    >>
    \new Lyrics \lyricsto "melody" { \set ignoreMelismata = ##t wie wir ver -- ge -- ben un -- sern Schul -- di -- "gern." Und füh -- re uns nicht in "Ver-" }
    \new PianoStaff <<
      \new Staff { \clef treble \global r1 r1 r1 r1 r1 r1 r1 <d' f'>\breve <cis' e'>1 <d' d'>\breve \bar "|" r1 r1 r1 r1 <b gis'>\breve <c' a'>1 <e' b'>1 }
      \new Staff { \clef bass \global r1 r1 r1 r1 r1 r1 r1 <d a>\breve <a, a>1 <d f>\breve \bar "|" r1 r1 r1 r1 e\breve <c e>1 <b, gis>1 }
    >>
  >>
  \layout {
    ragged-right = ##f
    \context { \Score \autoBeamOff \remove "Bar_number_engraver" }
    \context { \Lyrics \override LyricText.font-size = #-2 }
  }
}
