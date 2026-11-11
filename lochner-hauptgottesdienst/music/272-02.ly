\version "2.24.3"
% Lochner, Bugenhagen’sche Weise. PDF scan 272, printed p. 247.
#(set-global-staff-size 15)
\header { tagline = ##f }
\paper {
  paper-width = 145\mm left-margin = 3\mm right-margin = 1\mm
  top-margin = 0\mm bottom-margin = 0\mm indent = 0\mm
  print-page-number = ##f page-breaking = #ly:one-page-breaking
}
global = { \key f \major \accidentalStyle forget \omit Staff.TimeSignature \cadenzaOn }
\score {
  \new StaffGroup <<
    \new Staff <<
      \clef treble \global
      \new Voice = "pastor" { f'1 g'1 a'\breve g'\breve \bar "|" g'1 g'1 a'1 a'1 bes'\breve a'1 g'1 g'\breve( a'\breve) \bar "|" a'1 a'1 a'1 }
    >>
    \new Lyrics \lyricsto "pastor" { \set ignoreMelismata = ##t auch auf Er -- "den." Un -- ser täg -- lich Brod gib uns "heut." \skip 1 Und ver -- gib }
    \new PianoStaff <<
      \new Staff { \clef treble \global <d' f'>1 <e' g'>1 <f' g' a'>\breve <e' f' g'>\breve \bar "|" r1 r1 r1 r1 <d' e' f' bes'>\breve r1 r1 <e' g'>\breve( <f' g' a'>\breve) \bar "|" r1 r1 r1 }
      \new Staff { \clef bass \global <d a>1 <c c'>1 <f c'>\breve <c c'>\breve \bar "|" r1 r1 r1 r1 bes,\breve r1 r1 c\breve( f\breve) \bar "|" r1 r1 r1 }
    >>
  >>
  \layout {
    ragged-right = ##f
    \context { \Score \autoBeamOff \remove "Bar_number_engraver" }
    \context { \Lyrics \override LyricText.font-size = #-2 }
  }
}
